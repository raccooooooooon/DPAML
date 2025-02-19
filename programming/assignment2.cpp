#include <iostream>
#include <string>
#include <charconv>
using namespace std;
using std::stoi;
using std::from_chars;


/*int getMaxInRow(int[][], int, int, int);
int getMinInColumn(int[][], int, int, int);
void getSaddlePointCordinates(int [][],int ,int );
void getInputOf2dArray(int a[][], int, int);*/
int main()
{
    int x, y ;
    int m, n ;

    char inputlowerrange [256], inputsteps[256], inputupperrange [256] ;
    int lowerrange, steps, upperrange;
    cout << "enter the range of X: \n"  << "X=" ; //i.e. X=-5:0.5:5
        cin.getline( inputlowerrange, 256, ':') ;
        from_chars(inputlowerrange.c_str(), inputlowerrange.str() +inputlowerrange.length(), lowerrange):

        cout << lowerrange<< endl ;
        cin.getline(inputsteps, 256, ':') ;
        steps = 'inputsteps' - '0' ;
        cout << steps<< endl ;
        cin.getline(inputupperrange,256) ;
        upperrange = 'inputupperrange' - '0' ;
        cout << upperrange<< endl ;

    /*getInputOf2dArray(a, 5, 5);
    getSaddlePointCordinates(a,rows,columns);*/
}


/*
void getInputOf2dArray(int a[][], int m, int n)
{

    for (int i = 0; i < m; i = i + 1)
    {
        for (int j = 0; j < n; j = j + 1)
        {
            cin >> a[i][j];
        }
    }
}
void getSaddlePointCordinates(int a[][],int m,int n)
{
    int flag = 0;
    for (int rowNo = 0; rowNo < m; rowNo++)
    {
        for (int columnNo = 0; columnNo < 5; columnNo++)
        {
            if (getMaxInRow(a, rows, columns, rowNo) == getMinInColumn(a, rows, columns, columnNo))
            {
                flag = 1;
                cout << rowNo << columnNo;
            }
        }
    }
    if (flag == 0)
        cout << "no saddle point";
    cout << "\n";
}
int getMaxInRow(int a[][5], int row, int column, int rowNo)
{

    int max = a[rowNo][0];
    for (int i = 1; i < column; i = i + 1)
    {

        if (a[rowNo][i] > max)
            max = a[rowNo][i];
    }
    return max;
}
int  getMinInColumn(int a[][5], int row, int column, int columnNo)
{
    int min = a[0][columnNo];
    for (int i = 1; i < row; i = i + 1)
    {
        if (a[i][columnNo] < min)
            min = a[i][columnNo];
    }
    return min;
}*/
