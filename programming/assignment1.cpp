#include<iostream>
using namespace std;

int main()
{

  int inputMinute;
  cout << "Enter a number of minutes: ";
  cin >> inputMinute;

  int month = inputMinute /30/24/60;
  int day = (inputMinute -month*30*24*60) /24/60;
  int hour = (inputMinute -month*30*24*60 -day*24*60) /60;
  int minute = (inputMinute -month*30*24*60 -day*24*60) %60;

  cout << "The input corresponds to" << endl;
  cout << month << " month(s)" << endl;
  cout << day << " day(s)" << endl;
  cout << hour <<" hour(s)" << endl;
  cout << minute <<" minute(s)" << endl;
  return 0;
}
