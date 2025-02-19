#include<iostream>
#include<string>
using namespace std;

int main()
{
   string code;
   cout << "Enter a sequence of bits: ";
   cin >> code;
   int i = 0;
   while (i < code.length())
   {
    if (code[i] == '1')
    {
        i++;
        if (code[i] == '1')
            cout << "A";
        else if (code[i] == '0')
            cout << "B";
        i++;
    }
    else if (code[i] == '0')
    {
        i++;
        if (code[i] == '1')
        {
            cout << "C";
            i++;
        }
        else if (code[i] == '0')
        {
            i++;
            if (code[i] == '1')
                cout << "D";
            else if (code[i] == '0')
                cout << "E";
            i++;
        }
    }
   }
   cout << endl;
   return 0;
}
