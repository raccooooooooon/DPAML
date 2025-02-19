/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/
#include <iostream>
#include <string>
#include <bits/stdc++.h>
#include <cstdlib>
using namespace std;
using std::stoi;

    int chosefunction;
     string inputlowerrange, inputsteps, inputupperrange;
     float lowerrange, steps, upperrange;
     string inputlowerrangeY, inputstepsY, inputupperrangeY;
     float lowerrangeY, stepsY, upperrangeY;
        int m=(lowerrange+upperrange)/steps;;
        int n=(lowerrangeY+upperrangeY)/stepsY;;
        float array[100][100];


class Function
{
    public:

    void SelectFunction(int);
    void SetSampleMinX(float);
    //void SetSampleStepsX(float);
    //void SetSampleMaxX(float);
    void SetSampleMinY(float);
    //void SetSampleStepsY(float);
    //void SetSampleMaxY(float);
    void GenerateSampleMatrix();
    //void DetermineSaddlePoints();


};

    void SelectFunction()
    {
    cout << "Specifies which of 3 functions to sample.\n" << "(1) F(X,Y) = Y*sin X -X*cosY\n" << "(2) F(X,Y)=-cos X +sinY\n" <<"(3) F(X,Y)=sqrt(X^2+Y^2)" << endl;
    cin >> chosefunction;
    }
    void SetSampleMinX()
    {


            string input;
            cout << "X =" ;
            cin >> input;
            stringstream X(input);
            getline(X,inputlowerrange,':');
            lowerrange = stoi(inputlowerrange);
          /*
    }
    void SetSampleStepsX()
    {
        string inputsteps; //, inputupperrange;
        float  steps; //, upperrange;
        string input;
        getline(cin, input);
        stringstream X(input); */

        getline(X,inputsteps,':');
        steps = stof(inputsteps);
        /*
    }
    void SetSampleMaxX()
    {
        string inputupperrange;
        float upperrange;
        string input;
        getline(cin, input);
        stringstream X(input); */

        getline(X,inputupperrange,':');
        upperrange = stoi(inputupperrange);

    }
     void SetSampleMinY()
    {
        //string inputlowerrangeY, inputstepsY, inputupperrangeY;
        //float lowerrangeY, stepsY, upperrangeY;
        string inputY;
        cout << "Y =";
        cin >> inputY ;
        stringstream Y(inputY);
        getline(Y,inputlowerrangeY,':');
        lowerrangeY = stoi(inputlowerrangeY); /*
    }
    void SetSampleStepsY()
    {
        string inputstepsY; //, inputupperrangeY;tupperrange;
        float   upperrange;
        string input;
        getline(cin, input);
        float stepsY; //, upperrangeY;
        string inputY;
        getline(cin, inputY);
        stringstream Y(inputY);*/

        getline(Y,inputstepsY,':');
        stepsY = stof(inputstepsY);/*
    }
    void SetSampleMaxY()
    {
        string inputupperrangeY;
        float upperrangeY;
        string inputY;
        getline(cin, inputY);
        stringstream Y(inputY);*/

        getline(Y,inputupperrangeY,':');
        upperrangeY = stoi(inputupperrangeY);
    }
    void GenerateSampleMatrix()
    {

        float x = lowerrange;
        float y = lowerrangeY;
        int m = (-lowerrange+upperrange)/steps+1;
        int n = (-lowerrangeY+upperrangeY)/stepsY+1;
        float array[m][n];
        float temp = y;
        if (chosefunction == 1)
        {
            for (int i =0; i < m ; i = i + 1)
                {
                    for (int j = 0; j < n; j = j + 1)
                    {
                        array[i][j]=temp*sin(x)-(x*cos(temp));

                        temp = temp+stepsY;
                    }
                    temp = y;
                    x += steps;
                }
        }
        else if (chosefunction == 2)
        {
            for (int i =0; i < m ; i = i + 1)
                {
                    for (int j = 0; j < n; j = j + 1)
                    {
                        array[i][j]= - cos(x) + sin (temp);
                        temp = temp+stepsY;
                    }
                    temp = y;
                    x += steps;
                }
        }
        else if (chosefunction == 3)
        {
            for (int i =0; i < m ; i = i + 1)
                {
                    for (int j = 0; j < n; j = j + 1)
                    {
                        array[i][j]=sqrt(x*x + temp*temp);
                        temp = temp+stepsY;
                    }
                    temp=y;
                    x = x + steps;
                }
        }

    /* Function to find saddle point
    void DetermineSaddlePoints()
    {
          float lowerrange ;
        float lowerrangeY;
        float steps;
        float stepsY;
        float upperrange;
        float upperrangeY;
        float x = lowerrange;
        float y = lowerrangeY;
        int m = (lowerrange+upperrange)/steps;
        int n = (lowerrangeY+upperrangeY)/stepsY;
        float array[m][n];*/
        int flag = 0;
        int j = 0;
        int i = 0;
        int k = 0;
        int p = 0;
        int r = 0;


    for (int j = 0; j < n ; j++)
    {
        int max = 0;
        int min = 0;

        for (int i = 0; i < m ; i++) {
            if (array[i][j] > array[max][j]) {
                max = i;
                }
        }
        for (int k = 0; k < n; k++) {
            if (array[i][k] < array[i][min]) {
                min = k;
            }
        }
        if (min == j) {
            cout << "Saddle point(s) found at: ";
            cout << "X = " << lowerrange + max * steps << ", Y = " << lowerrangeY + min * stepsY << "\n";
            flag = 1;
        }
        for (int p = 0; p < m ; p++) {
            if (array[p][j] == array[max][min] && p!=max){
                for (int r = 0; r < n; r++) {
                    if (array[p][r] < array[p][min]) {
                        min = r;
                    }
                }
                if (min == j) {
                    cout << "Saddle point(s) found at: ";
                    cout << "X = " << lowerrange + p * steps << ", Y = " << lowerrangeY + min * stepsY << "\n";
                    flag = 1;
                }
            }
        }


    }
    for (int j = 0; j < n ; j++)
    {
        int mmax=0;
        int mmin=0;
        for (int i = 0; i < m ; i++) {

            if (array[i][j] < array[mmin][j]) {
                mmin = i;
                }
        }
        for (int k = 0; k < n; k++) {
            if (array[i][k] > array[i][mmax]) {
                mmax = k;
            }
        }
        if ( k == j) {
            cout << "Saddle point(s) found at: ";
            cout << "X = " << lowerrange + mmin * steps << ", Y = " << lowerrangeY + mmax * stepsY << "\n";
            flag = 1;
        }
        for (int p = 0; p < n ; p++) {
            if (array[j][p] == array[mmin][mmax] && p!=mmin){
                for (int r = 0; r < m; r++) {
                    if (array[r][p] > array[mmax][p]) {
                        mmax = r;
                    }
                }
                if (mmax == j) {
                    cout << "Saddle point(s) found at: ";
                    cout << "X = " << lowerrange + mmax * steps << ", Y = " << lowerrangeY + p * stepsY << "\n";
                    flag = 1;
                }
            }
        }


}



    if (flag == 0) {
        cout << "No saddle points\n" << endl;
    }

    }


    int main()
    {
        SelectFunction();
        //cout << "step1\n" << chosefunction<< endl;
        SetSampleMinX();
        //cout << "step2\n" ;
        //cout << lowerrange<<" "<< steps<<" "<<upperrange<< endl;
        //SetSampleStepsX();
        //SetSampleMaxX();
        SetSampleMinY();
        // cout << "step3\n" ;
        //cout << lowerrange<<" "<< steps<<" "<<upperrange<<endl;
        //cout << lowerrangeY<<" "<< stepsY<<" "<<upperrangeY<<endl;
        //SetSampleStepsY();
        //SetSampleMaxY();
        GenerateSampleMatrix();
        //cout << "step4\n";
        //DetermineSaddlePoints();

        return 0;
    }



