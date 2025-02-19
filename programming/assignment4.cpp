#include <iostream>
#include <iomanip>
#include <algorithm>
#include <cmath>
using namespace std;

const int NUMBER_QUIZZES = 6;
const int MAX_STUDENTS = 10;

void setCoutPrecision(int numberPrecision);
void readStudentGrades(int studentGrades[][NUMBER_QUIZZES], int& numberStudents);
void computeSemesterGrades(const int studentGrades[][NUMBER_QUIZZES], int numberStudents, double semesterGrades[]);
void displayOriginalGrades(const int studentGrades[][NUMBER_QUIZZES], int numberStudents);
void displaySemesterGrades(const double semesterGrades[], int numberStudents);
void displayHardQuiz(const int studentGrades[][NUMBER_QUIZZES], int numberStudents);

int main()
{
  int numberStudents;
  int studentGrades[MAX_STUDENTS][NUMBER_QUIZZES] = {0};
  readStudentGrades(studentGrades, numberStudents);
  //displayOriginalGrades(studentGrades, numberStudents);

  double semesterGrades[MAX_STUDENTS] = {0};
  computeSemesterGrades(studentGrades, numberStudents, semesterGrades);
  displaySemesterGrades(semesterGrades, numberStudents);
  displayHardQuiz(studentGrades, numberStudents);
  return 0;
}

void readStudentGrades(int studentGrades[][NUMBER_QUIZZES], int& numberStudents)
{
  cout << "Enter the number of students: ";
  cin >> numberStudents;
  cout << "Enter the scores for each student: ";
  for (int i = 0; i < numberStudents; ++i)
  {
     for (int j = 0; j < NUMBER_QUIZZES; ++j)
     {
        cin >> studentGrades[i][j];
     }
  }
}

void setCoutPrecision(int numberPrecision)
{
  cout.setf(ios::fixed);
  cout.setf(ios::showpoint);
  cout.precision(numberPrecision);
}

void displayOriginalGrades(const int studentGrades[][NUMBER_QUIZZES], int numberStudents)
{
  for (int s = 0; s < numberStudents; ++s)
  {
    for (int q = 0; q < NUMBER_QUIZZES; ++q)
    {
       cout << setw(5) << studentGrades[s][q];
    }
    cout << endl;
  }
}

void displaySemesterGrades(const double semesterGrades[], int numberStudents)
{
  setCoutPrecision(1);
  cout << "Table of Semester Grades:" << endl;
  cout << "       ";
  for (int i = 0; i < numberStudents; ++i)
     cout << setw(6) << "Stud" << i+1;
  cout << endl;
  cout << "Grades:";
  for (int i = 0; i < numberStudents; ++i)
     cout << setw(7) << semesterGrades[i];
  cout << endl;
}

void computeSemesterGrades(const int studentGrades[][NUMBER_QUIZZES], int numberStudents, double semesterGrades[])
{
  int rowTemp[NUMBER_QUIZZES];
  for (int i = 0; i < numberStudents; ++i)
  {    for (int j = 0; j < NUMBER_QUIZZES; ++j)
        rowTemp[j] = studentGrades[i][j];
       sort(rowTemp,rowTemp+NUMBER_QUIZZES);
       semesterGrades[i] = (rowTemp[5]+rowTemp[4]+rowTemp[3]+rowTemp[2])/4.0;
     // copy the ith row of studentGrades to rowTemp
     // sort rowTemp
     // compute the average of the 4 highest scores from rowTemp
     // update semesterGrades[i]
  }
}

void displayHardQuiz(const int studentGrades[][NUMBER_QUIZZES], int numberStudents)
{
  int quizIndex = 1;
  int temp0=0,temp1=0,temp2=0,temp3=0,temp4=0,temp5=0;


    for (int j = 0; j <numberStudents; ++j)
    {
       temp0 += studentGrades[j][0];
       temp1 += studentGrades[j][1];
       temp2 += studentGrades[j][2];
       temp3 += studentGrades[j][3];
       temp4 += studentGrades[j][4];
       temp5 += studentGrades[j][5];
    }

    if ((temp5<temp4)&&(temp5<temp3)&&(temp5<temp2)&&(temp5<temp1)&&(temp5<temp0))
    quizIndex = 6 ;
    if ((temp4<temp5)&&(temp4<temp3)&&(temp4<temp2)&&(temp4<temp1)&&(temp4<temp0))
    quizIndex = 5 ;
    if ((temp3<temp4)&&(temp3<temp5)&&(temp3<temp2)&&(temp3<temp1)&&(temp3<temp0))
    quizIndex = 4 ;
    if ((temp2<temp4)&&(temp2<temp3)&&(temp2<temp5)&&(temp2<temp1)&&(temp2<temp0))
    quizIndex = 3 ;
    if ((temp1<temp4)&&(temp1<temp3)&&(temp1<temp2)&&(temp1<temp5)&&(temp1<temp0))
    quizIndex = 2 ;
  // add your code here
  cout << "The number " << quizIndex << " quiz is the most difficult one.\n";
}
