#!/usr/bin/env python

import cv2
import numpy as np
import sys
sys.path.append('/home/ros/tmr_ros1/devel/lib/python3/dist-packages')
import rospy
from tm_msgs.msg import *
from tm_msgs.srv import *
import argparse
from math import atan2, cos, sin, sqrt, pi
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import random
import itertools
from scipy import linalg



# 已知的标定数据
x1 = np.array([[317,235,1],[363,326,1],[178,181,1],[222,310,1],[282,141.5,1],[239,231,1],[296.7,335,1],[384.7,239.8,1],[233.7,152,1]])  
y1 = np.array([[582.51],[641],[585],[677],[511],[605],[666],[555],[535]])  
y2 = np.array([[286.83],[364.5],[152],[231],[227],[220],[305],[350],[187]]) 

# 手眼标定矩阵
A, r, rank, s = np.linalg.lstsq((x1), (y1), rcond=None)
#print(A)
B, r1, rank1, s1 = np.linalg.lstsq((x1), (y2), rcond=None)

# 测试转换
input_image_point = np.array([centerx,centery,1])  # 待转换的二维图像坐标
output_tcp_pointx = np.dot(input_image_point, A) 
output_tcp_pointy = np.dot(input_image_point, B) 

X = output_tcp_pointx
Y = output_tcp_pointy
X = np.squeeze(X)
Y = np.squeeze(Y)
X = str(X)
Y = str(Y)



#print("输入的二维图像坐标：", input_image_point)
#print("转换后的TCP坐标：", output_tcp_point)

def send_script(script):
    rospy.wait_for_service('/tm_driver/send_script')
    try:
        script_service = rospy.ServiceProxy('/tm_driver/send_script', SendScript)
        move_cmd = SendScriptRequest()
        move_cmd.script = script
        resp1 = script_service(move_cmd)
    except rospy.ServiceException as e:
        print("Send script service call failed: %s"%e)
        
if __name__ == '__main__':
    try:
        rospy.init_node('send_scripts', anonymous=True)
        targetP1 = " ,-35.49 , -178.26 , -1.79 , 88.19"
        script = "PTP(\"CPP\","+X+", "+Y+targetP1+",100,200,0,false)"
        send_script(script)
    except rospy.ROSInterruptException:
        pass

