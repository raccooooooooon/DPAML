#!/usr/bin/env python
# YOLOv5 🚀 by Ultralytics, GPL-3.0 license
"""
Run inference on images, videos, directories, streams, etc.

Usage:
    $ python path/to/detect.py --weights yolov5s.pt --source 0  # webcam
                                                             img.jpg  # image
                                                             vid.mp4  # video
                                                             path/  # directory
                                                             path/*.jpg  # glob
                                                             'https://youtu.be/Zgi9g1ksQHc'  # YouTube
                                                             'rtsp://example.com/media.mp4'  # RTSP, RTMP, HTTP stream
"""

import argparse
import os
import sys
from pathlib import Path

import time
import numpy as np
import math
import cv2
import torch
import torch.backends.cudnn as cudnn

import shutil
from goprohero import GoProHero

FILE = Path(__file__).resolve()
ROOT = FILE.parents[0]  # YOLOv5 root directory
if str(ROOT) not in sys.path:
    sys.path.append(str(ROOT))  # add ROOT to PATH
ROOT = Path(os.path.relpath(ROOT, Path.cwd()))  # relative

from models.common import DetectMultiBackend
from utils.datasets import IMG_FORMATS, VID_FORMATS, LoadImages, LoadStreams
from utils.general import (LOGGER, check_file, check_img_size, check_imshow, check_requirements, colorstr,
                           increment_path, non_max_suppression, non_max_suppression_obb, print_args, scale_coords, scale_polys, strip_optimizer, xyxy2xywh)
from utils.plots import Annotator, colors, save_one_box
from utils.torch_utils import select_device, time_sync
from utils.rboxs_utils import poly2rbox, rbox2poly

import rospy
from tm_msgs.msg import *
from tm_msgs.srv import *
import argparse
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import random
import itertools
from scipy import linalg


def distance_2d(point1, point2):
    # point1 和 point2 是表示点的元组或列表，例如 (x, y)

    x1, y1 = point1
    x2, y2 = point2

    # 计算两点之间的距离
    d = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

    return d
    
def compute_center(p1, p2, p3, p4):
    
    x1, y1 = p1
    x2, y2 = p2
    x3, y3 = p3
    x4, y4 = p4
    
    centerx = (x1 + x2 + x3 + x4)/4
    centery = (y1 + y2 + y3 + y4)/4
    center = (centerx , centery)
    return center  
    

@torch.no_grad()
def run(weights=ROOT / 'yolov5s.pt',  # model.pt path(s)
        source=ROOT / 'data/images',  # file/dir/URL/glob, 0 for webcam
        imgsz=(640, 640),  # inference size (height, width)
        conf_thres=0.25,  # confidence threshold
        iou_thres=0.45,  # NMS IOU threshold
        max_det=1000,  # maximum detections per image
        device='',  # cuda device, i.e. 0 or 0,1,2,3 or cpu
        view_img=False,  # show results
        save_txt=False,  # save results to *.txt
        save_conf=False,  # save confidences in --save-txt labels
        save_crop=False,  # save cropped prediction boxes
        nosave=False,  # do not save images/videos
        classes=None,  # filter by class: --class 0, or --class 0 2 3
        agnostic_nms=False,  # class-agnostic NMS
        augment=False,  # augmented inference
        visualize=False,  # visualize features
        update=False,  # update all models
        project=ROOT / 'runs/detect',  # save results to project/name
        name='exp',  # save results to project/name
        exist_ok=False,  # existing project/name ok, do not increment
        line_thickness=3,  # bounding box thickness (pixels)
        hide_labels=False,  # hide labels
        hide_conf=False,  # hide confidences
        half=False,  # use FP16 half-precision inference
        dnn=False,  # use OpenCV DNN for ONNX inference
        ):

    source = str(source)
    save_img = not nosave and not source.endswith('.txt')  # save inference images
    is_file = Path(source).suffix[1:] in (IMG_FORMATS + VID_FORMATS)
    is_url = source.lower().startswith(('rtsp://', 'rtmp://', 'http://', 'https://'))
    webcam = source.isnumeric() or source.endswith('.txt') or (is_url and not is_file)
    if is_url and is_file:
        source = check_file(source)  # download

    # Directories
    save_dir = increment_path(Path(project) / name, exist_ok=exist_ok)  # increment run
    (save_dir / 'labels' if save_txt else save_dir).mkdir(parents=True, exist_ok=True)  # make dir

    # Load model
    device = select_device(device)
    model = DetectMultiBackend(weights, device=device, dnn=dnn)
    stride, names, pt, jit, onnx, engine = model.stride, model.names, model.pt, model.jit, model.onnx, model.engine
    imgsz = check_img_size(imgsz, s=stride)  # check image size

    # Half
    half &= (pt or jit or engine) and device.type != 'cpu'  # half precision only supported by PyTorch on CUDA
    if pt or jit:
        model.model.half() if half else model.model.float()

    # Dataloader
    if webcam:
        view_img = check_imshow()
        cudnn.benchmark = True  # set True to speed up constant image size inference
        dataset = LoadStreams(source, img_size=imgsz, stride=stride, auto=pt)
        bs = len(dataset)  # batch_size
    else:
        dataset = LoadImages(source, img_size=imgsz, stride=stride, auto=pt)
        bs = 1  # batch_size
    vid_path, vid_writer = [None] * bs, [None] * bs

    # Run inference
    model.warmup(imgsz=(1, 3, *imgsz), half=half)  # warmup
    dt, seen = [0.0, 0.0, 0.0], 0

    for path, im, im0s, vid_cap, s in dataset:
        t1 = time_sync()
        im = torch.from_numpy(im).to(device)
        im = im.half() if half else im.float()  # uint8 to fp16/32
        im /= 255  # 0 - 255 to 0.0 - 1.0
        if len(im.shape) == 3:
            im = im[None]  # expand for batch dim
        t2 = time_sync()
        dt[0] += t2 - t1

        # Inference
        visualize = increment_path(save_dir / Path(path).stem, mkdir=True) if visualize else False
        pred = model(im, augment=augment, visualize=visualize)
        t3 = time_sync()
        dt[1] += t3 - t2

        # NMS
        # pred: list*(n, [xylsθ, conf, cls]) θ ∈ [-pi/2, pi/2)
        pred = non_max_suppression_obb(pred, conf_thres, iou_thres, classes, agnostic_nms, multi_label=True, max_det=max_det)
        dt[2] += time_sync() - t3

        # Second-stage classifier (optional)
        # pred = utils.general.apply_classifier(pred, classifier_model, im, im0s)

        # Process predictions
        # test for center
        centers = []
        #
        for i, det in enumerate(pred):  # per image
            pred_poly = rbox2poly(det[:, :5]) # (n, [x1 y1 x2 y2 x3 y3 x4 y4])

            seen += 1
            if webcam:  # batch_size >= 1
                p, im0, frame = path[i], im0s[i].copy(), dataset.count
                s += f'{i}: '
            else:
                p, im0, frame = path, im0s.copy(), getattr(dataset, 'frame', 0)

            p = Path(p)  # to Path
            save_path = str(save_dir / p.name)  # im.jpg
            txt_path = str(save_dir / 'labels' / p.stem) + ('' if dataset.mode == 'image' else f'_{frame}')  # im.txt
            #s += '%gx%g ' % im.shape[2:]  # print string
            #s += f"ratio: {ratio:.2f},"
            #s += f"pred_poly: {pred_poly}, "
            gn = torch.tensor(im0.shape)[[1, 0, 1, 0]]  # normalization gain whwh
            imc = im0.copy() if save_crop else im0  # for save_crop
            annotator = Annotator(im0, line_width=line_thickness, example=str(names))
            if len(det):
                # Rescale polys from img_size to im0 size
                # det[:, :4] = scale_coords(im.shape[2:], det[:, :4], im0.shape).round()
                pred_poly = scale_polys(im.shape[2:], pred_poly, im0.shape)
                s += f"pred_poly: {pred_poly}, "
                # 取得四個角的座標
                p1 = (pred_poly[0][0],pred_poly[0][1]) #右上
                p2 = (pred_poly[0][2],pred_poly[0][3]) #左上
                p3 = (pred_poly[0][4],pred_poly[0][5]) #左下
                p4 = (pred_poly[0][6],pred_poly[0][7]) #右下
                # 計算長與寬,並計算長寬比
                width = distance_2d(p1,p2)
                length = distance_2d(p2,p3)
                ratio = 0
                if width>length:
                    ratio = width/length
                    longp1, longp2 = p1 ,p2 
                else:
                    ratio = length/width
                    longp1, longp2 = p2, p3
                
                longpx1, longpy1 = longp1
                longpx2, longpy2 = longp2
                longpx1 = longpx1.cpu().numpy()
                longpy1 = longpy1.cpu().numpy()
                longpx2 = longpx2.cpu().numpy()
                longpy2 = longpy2.cpu().numpy()
                tflongpx1, tflongpy1 = calibration(longpx1, longpy1)
                tflongpx2, tflongpy2 = calibration(longpx2, longpy2)    
                angle = calculate_angle(float(tflongpx1), float(tflongpy1), float(tflongpx2), float(tflongpy2))
                
                angle = angle+90
                angle = str(angle)                           
                # 計算中心點座標    
                center = compute_center(p1, p2, p3, p4)
                centers.append(center)
                for center in centers:
                    centerx = center[0].cpu()
                    centery = center[1].cpu()
                    centerx = centerx.numpy()
                    centery = centery.numpy()
                    # 透過九點標定法,將webcam上物體的座標轉換成機器手臂的座標
                    centertfX , centertfY = calibration(centerx,centery)

                #s += f"centertf: {centertf}, "
                #s += f"angle: {angle},  "
                det = torch.cat((pred_poly, det[:, -2:]), dim=1) # (n, [poly conf cls])
                classnumber = det[:, -1]
                
                move = False

                if torch.any(classnumber == 1):    
                    move = True
                    webcam = False
                    grab = False
                    while(move):
                        set_io(0.0)
                        rospy.init_node('send_scripts', anonymous=True)
                        targetP1 = " ,300 , -178.26 , -1.79 , "
                        script1 = "PTP(\"CPP\","+centertfX+", "+centertfY+targetP1+angle+",100,200,0,false)"
                        send_script(script1)
                        targetP2 = " ,-39.5 , -178.26 , -1.79 , "
                        script2 = "PTP(\"CPP\","+centertfX+", "+centertfY+targetP2+angle+",100,200,0,false)"
                        send_script(script2)

                        time.sleep(1)
                    	 #rospy.sleep(9)
                        set_io(1.0)
                        time.sleep(1)

                        targetcylinder = "204.7,-13.01,339.16,171.66,-9.51,82.23"
                        scriptcylinder = "PTP(\"CPP\","+targetcylinder+",100,200,0,false)"
                        send_script(scriptcylinder)
                        set_io(0.0)
                        time.sleep(20)
                        move = False
                        webcam = True
                        '''while(ask_item_demo()):
                            if ("204.7,-13.01,339.16,171.66,-9.51,82.23"== ask_item_demo()):
                                move = False
                                webcam = True
                                break
                            else:
                                continue     '''

                elif torch.any(classnumber == 0):    
                    move = True
                    webcam = False
                    while(move):
                    	set_io(0.0)
                    	rospy.init_node('send_scripts', anonymous=True)
                    	targetP1 = " ,-39 , -178.26 , -1.79 , 88.19"
                    	script = "PTP(\"CPP\","+centertfX+", "+centertfY+targetP1+",100,200,0,false)"
                    	send_script(script)
                    	#rospy.sleep(9)
                    	set_io(1.0)
                    	targetcylinder = "204.7,-13.01,339.16,171.66,-9.51,82.23"
                    	scriptcylinder = "PTP(\"CPP\","+targetcylinder+",100,200,0,false)"
                    	send_script(scriptcylinder)
                    	set_io(0.0) 
                    	time.sleep(20)
                    	move = False
                    	webcam = True                    	
                    	              
                elif torch.any(classnumber == 2):    
                    move = True
                    webcam = False
                    while(move):
                    	set_io(0.0)
                    	rospy.init_node('send_scripts', anonymous=True)
                    	targetP1 = " ,-39 , -178.26 , -1.79 , 88.19"
                    	script = "PTP(\"CPP\","+centertfX+", "+centertfY+targetP1+",100,200,0,false)"
                    	send_script(script)
                    	#rospy.sleep(9)
                    	set_io(1.0)
                    	targetcylinder = "204.7,-13.01,339.16,171.66,-9.51,82.23"
                    	scriptcylinder = "PTP(\"CPP\","+targetcylinder+",100,200,0,false)"
                    	send_script(scriptcylinder)
                    	set_io(0.0) 
                    	time.sleep(20)
                    	move = False
                    	webcam = True                        

                elif torch.any(classnumber == 3):    
                    move = True
                    webcam = False
                    while(move):
                    	set_io(0.0)
                    	rospy.init_node('send_scripts', anonymous=True)
                    	targetP1 = " ,-39 , -178.26 , -1.79 , 88.19"
                    	script = "PTP(\"CPP\","+centertfX+", "+centertfY+targetP1+",100,200,0,false)"
                    	send_script(script)
                    	#rospy.sleep(9)
                    	set_io(1.0)
                    	targetcylinder = "204.7,-13.01,339.16,171.66,-9.51,82.23"
                    	scriptcylinder = "PTP(\"CPP\","+targetcylinder+",100,200,0,false)"
                    	send_script(scriptcylinder)
                    	set_io(0.0) 
                    	time.sleep(20)
                    	move = False
                    	webcam = True    
                    	
                elif torch.any(classnumber == 4):    
                    move = True
                    webcam = False
                    while(move):
                    	set_io(0.0)
                    	rospy.init_node('send_scripts', anonymous=True)
                    	targetP1 = " ,-39 , -178.26 , -1.79 , 88.19"
                    	script = "PTP(\"CPP\","+centertfX+", "+centertfY+targetP1+",100,200,0,false)"
                    	send_script(script)
                    	#rospy.sleep(9)
                    	set_io(1.0)
                    	targetcylinder = "204.7,-13.01,339.16,171.66,-9.51,82.23"
                    	scriptcylinder = "PTP(\"CPP\","+targetcylinder+",100,200,0,false)"
                    	send_script(scriptcylinder)
                    	set_io(0.0) 
                    	time.sleep(20)
                    	
                    	move = False
                    	webcam = True                        	
                	
                # Print results
                for c in det[:, -1].unique():
                    n = (det[:, -1] == c).sum()  # detections per class
                    s += f"{n} {names[int(c)]}{'s' * (n > 1)}, "  # add to string

                # Write results
                for *poly, conf, cls in reversed(det):
                    if save_txt:  # Write to file
                        # xywh = (xyxy2xywh(torch.tensor(xyxy).view(1, 4)) / gn).view(-1).tolist()  # normalized xywh
                        poly = poly.tolist()
                        line = (cls, *poly, conf) if save_conf else (cls, *poly)  # label format
                        with open(txt_path + '.txt', 'a') as f:
                            f.write(('%g ' * len(line)).rstrip() % line + '\n')

                    if save_img or save_crop or view_img:  # Add poly to image
                        c = int(cls)  # integer class
                        label = None if hide_labels else (names[c] if hide_conf else f'{names[c]} {conf:.2f}')
                        # annotator.box_label(xyxy, label, color=colors(c, True))
                        annotator.poly_label(poly, label, color=colors(c, True))
                        if save_crop: # Yolov5-obb doesn't support it yet
                            # save_one_box(xyxy, imc, file=save_dir / 'crops' / names[c] / f'{p.stem}.jpg', BGR=True)
                            pass
           # TCP = ask_item_demo()
           # s += f"{TCP},"
            # Print time (inference-only)
            LOGGER.info(f'{s}Done. ({t3 - t2:.3f}s)')

            # Stream results
            im0 = annotator.result()
            if view_img:
                cv2.imshow(str(p), im0)
                cv2.waitKey(1)  # 1 millisecond

            # Save results (image with detections)
            if save_img:
                if dataset.mode == 'image':
                    cv2.imwrite(save_path, im0)
                else:  # 'video' or 'stream'
                    if vid_path[i] != save_path:  # new video
                        vid_path[i] = save_path
                        if isinstance(vid_writer[i], cv2.VideoWriter):
                            vid_writer[i].release()  # release previous video writer
                        if vid_cap:  # video
                            fps = vid_cap.get(cv2.CAP_PROP_FPS)
                            w = int(vid_cap.get(cv2.CAP_PROP_FRAME_WIDTH))
                            h = int(vid_cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
                        else:  # stream
                            fps, w, h = 30, im0.shape[1], im0.shape[0]
                            save_path += '.mp4'
                        vid_writer[i] = cv2.VideoWriter(save_path, cv2.VideoWriter_fourcc(*'mp4v'), fps, (w, h))
                    vid_writer[i].write(im0)

    # Print results
    t = tuple(x / seen * 1E3 for x in dt)  # speeds per image
    LOGGER.info(f'Speed: %.1fms pre-process, %.1fms inference, %.1fms NMS per image at shape {(1, 3, *imgsz)}' % t)
    if save_txt or save_img:
        s = f"\n{len(list(save_dir.glob('labels/*.txt')))} labels saved to {save_dir / 'labels'}" if save_txt else ''
        LOGGER.info(f"Results saved to {colorstr('bold', save_dir)}{s}")
    if update:
        strip_optimizer(weights)  # update model (to fix SourceChangeWarning)


def parse_opt():
    parser = argparse.ArgumentParser()
    parser.add_argument('--weights', nargs='+', type=str, default=ROOT / 'runs/train/yolov5n_DroneVehicle/weights/best.pt', help='model path(s)')
    parser.add_argument('--source', type=str, default='/media/test/4d846cae-2315-4928-8d1b-ca6d3a61a3c6/DroneVehicle/val/raw/images/', help='file/dir/URL/glob, 0 for webcam')
    parser.add_argument('--imgsz', '--img', '--img-size', nargs='+', type=int, default=[840], help='inference size h,w')
    parser.add_argument('--conf-thres', type=float, default=0.25, help='confidence threshold')
    parser.add_argument('--iou-thres', type=float, default=0.2, help='NMS IoU threshold')
    parser.add_argument('--max-det', type=int, default=1000, help='maximum detections per image')
    parser.add_argument('--device', default='3', help='cuda device, i.e. 0 or 0,1,2,3 or cpu')
    parser.add_argument('--view-img', action='store_true', help='show results')
    parser.add_argument('--save-txt', action='store_true', help='save results to *.txt')
    parser.add_argument('--save-conf', action='store_true', help='save confidences in --save-txt labels')
    parser.add_argument('--save-crop', action='store_true', help='save cropped prediction boxes')
    parser.add_argument('--nosave', action='store_true', help='do not save images/videos')
    parser.add_argument('--classes', nargs='+', type=int, help='filter by class: --classes 0, or --classes 0 2 3')
    parser.add_argument('--agnostic-nms', action='store_true', help='class-agnostic NMS')
    parser.add_argument('--augment', action='store_true', help='augmented inference')
    parser.add_argument('--visualize', action='store_true', help='visualize features')
    parser.add_argument('--update', action='store_true', help='update all models')
    parser.add_argument('--project', default='runs/detect', help='save results to project/name')
    parser.add_argument('--name', default='exp', help='save results to project/name')
    parser.add_argument('--exist-ok', action='store_true', help='existing project/name ok, do not increment')
    parser.add_argument('--line-thickness', default=2, type=int, help='bounding box thickness (pixels)')
    parser.add_argument('--hide-labels', default=False, action='store_true', help='hide labels')
    parser.add_argument('--hide-conf', default=False, action='store_true', help='hide confidences')
    parser.add_argument('--half', action='store_true', help='use FP16 half-precision inference')
    parser.add_argument('--dnn', action='store_true', help='use OpenCV DNN for ONNX inference')
    opt = parser.parse_args()
    opt.imgsz *= 2 if len(opt.imgsz) == 1 else 1  # expand
    print_args(FILE.stem, opt)
    return opt


def calibration(centerx,centery):

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
    return(X,Y)


def calculate_angle(x1, y1, x2, y2):

    angle = math.atan((y2-y1)/(x2-x1))
    
    angle_degrees = math.degrees(angle)

    return angle_degrees

def send_script(script):
    rospy.wait_for_service('/tm_driver/send_script')
    try:
        script_service = rospy.ServiceProxy('/tm_driver/send_script', SendScript)
        move_cmd = SendScriptRequest()
        move_cmd.script = script
        resp1 = script_service(move_cmd)
    except rospy.ServiceException as e:
        print("Send script service call failed: %s"%e)


def set_io(state):
    rospy.wait_for_service('/tm_driver/set_io')
    try:
        io_service = rospy.ServiceProxy('/tm_driver/set_io', SetIO)
        io_cmd = SetIORequest()
        io_cmd.module = 1
        io_cmd.type = 1
        io_cmd.pin = 0
        io_cmd.state = state
        resp1 = io_service(io_cmd)
        print("state is %d",io_cmd.state)
    except rospy.ServiceException as e:
        print("IO service call failed: %s"%e)

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + ': id: %s, content: %s\n', data.id, data.content)

def ask_item_demo():
    rospy.init_node('ask_item_demo')

    # listen to 'tm_driver/svr_response' topic
    rospy.Subscriber('tm_driver/svr_response', SvrResponse, callback)

    # using 'tm_driver/ask_item' service
    rospy.wait_for_service('tm_driver/ask_item')
    ask_item = rospy.ServiceProxy('tm_driver/ask_item', AskItem)

    rospy.sleep(0.5)

    # ask hand-eye info. (non-block)
    res0 = ask_item('he0', 'Coord_Robot_Tool', 1)
    #rospy.loginfo('id: %s, value: %s\n', res0.id, res0.value)
    

    position = res0.value

    a,b= position.split("=",1)
    return b




def capture_and_save_photo(gopro, save_folder):
    # 初始化GoPro相機
    gopro = GoProHero(password='your_gopro_password', ip_address='your_gopro_ip_address')

    # 指定儲存相片的資料夾
    save_folder = 'path/to/your/folder/'
    
    # 拍攝照片
    gopro.take_photo()

    # 等待片刻確保相片儲存完成
    time.sleep(5)

    # 獲取最新的相片
    latest_photo = gopro.get_media().last()

    # 構建相片完整路徑
    photo_path = latest_photo.download(save_folder)

    # 複製相片到指定的儲存資料夾，覆蓋舊有的檔案
    shutil.copy(photo_path, save_folder)







def main(opt):
    check_requirements(exclude=('tensorboard', 'thop'))
    run(**vars(opt))


if __name__ == "__main__":  

    opt = parse_opt()
    main(opt)

    
    
    
    
