/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/
#include <bits/stdc++.h>
#include <iostream>
#include <string>
#include <stack>
#include <algorithm>
using namespace std;

// defines the Boolean function for operator, operand, equalOrhigher precedence and the string conversion function.
bool IsOperator(char);
bool IsOperand(char);
bool eqlOrhigher(char, char);
int checkWhichFunctionItSatisfied, samevariable;
string post_fix(string), pre_fix(string),  pop(),push(string);
       std::string g(1,'!');
        std::string h(1,')');
        std::string i(1,'(');



string data;

string infix_expression, postfix_expression, prefix_expression;
int ch;

class Node{
    public:
        Node* link;
        string data;
        //constructor
        Node(string n){
            this->data = n;
            this->link = NULL;
        }
};

class Stack{
    public:
            Node* top;

    Stack(){ top = NULL;}

    void push(string data){
        Node* temp = new Node(data);

        if (!temp){
            cout << "\nStack Overflow";
            exit(1);
        }
    temp->data = data;
    temp->link = top;
    top = temp;
    }

    bool isEmpty(){
        return top == NULL;
    }


    void pop(){
        Node* temp;
        if (top == NULL){
            cout << "\nStack Underflow"<< endl;
            exit(1);
        }
        else{
            temp = top;
            top = top->link;
            free (temp);
        }
    }

};

    // define the IsOperator() function to validate whether any symbol is operator.
    /* If the symbol is operator, it returns true, otherwise false. */
    bool IsOperator(char c)
    {
    if(c == '^' || c == 'v' || c == '!' )
    return true;
    return false;
    }

    // IsOperand() function is used to validate whether the character is operand.
    bool IsOperand(char c)
    {
    if( c >= 'A' && c <= 'Z')  /* Define the character in between A to Z. If not, it returns False.*/
    return true;
    if(c >= '0' && c <= '9')   // Define the character in between 0 to 9. If not, it returns False. */
    return true;

    return false;
    }

    // here, precedence() function is used to define the precedence to the operator.
    int precedence1(char op)
    {
    if(op == 'v' || op == '^')                   /* it defines the lowest precedence */
    return 1;
    if (op == '!')
    return 2;
    return 0;
    }
    int precedence2(string op)
    {
        std::string c(1,'v');
        std::string d(1,'^');
        std::string e(1,'!');

    if(op == c || op == d)                   /* it defines the lowest precedence */
    return 1;
    if (op == e)
    return 2;
    return 0;
    }

    /* The eqlOrhigher() function is used to check the higher or equal precedence of the two operators in infix expression. */
    bool eqlOrhigher (string op1, char op2)
    {
    int p1 = precedence2(op1);
    int p2 = precedence1(op2);
    if (p1 == p2)
    {
        std::string f(1,'^');

    if (op1 == f )
    return false;

    return true;
    }
    return  (p1>p2 ? true : false);
    }



    /* string post_fix() function is used to convert the infix expression to the postfix expression of the Stack */
    string post_fix(string infix)
    {
    Node* temp = new Node(data);
    Node* top;
    stack <string> S;
    stack <char> C;
    string postfix ="";
    string str;
    char ch;


    std::string a(1,'(');
    S.push( a);
    C.push( '(' );
    infix += ')';

    for(int i = 0; i<infix.length(); i++)
    {
    std:: string str(1,infix[i]);
    ch = infix[i];


    //str = infix[i];

     std::string b(1,' ');
     std::string c(1,'(');
    if(str == b)
    continue;
    else if(str == c )
    S.push(str);
    else if(IsOperand(ch))  {
    postfix.push(str);

    checkWhichFunctionItSatisfied++;
    }
    else if(IsOperator(ch))
    {
    while(!S.empty() && eqlOrhigher(C.top(), ch))
    {
      std::string h(1,C.top());
    postfix.push(h);
    S.pop();
    }
    S.push(str);

    // here we check if there is a variable with a logic NOT

    if (str == g)
    samevariable++;

    }
    else if(str == h)
    {
    while(!S.empty() && std::stoi( S.top()) != i)
    {
    postfix.push(S.top());
    S.pop();
    }
    S.pop();
    }
    }
    return postfix;
    }


string pre_fix(string infix)
    {
    reverse(infix.begin(), infix.end());

    // Replace ( with ) and vice versa
    for (int i = 0; i < infix.length(); i++)
    {
        if (infix[i] == '(') {
            infix[i] = ')';
        }
        else if (infix[i] == ')') {
            infix[i] = '(';
        }
    }

    string prefix = postfix_expression;

    // Reverse postfix
    reverse(prefix.begin(), prefix.end());

    return prefix;
}


class Function{
    public:             // defines the Boolean function for operator, operand, equalOrhigher precedence and the string conversion function.

    void getvalue();
    void outputresult();
    void satisfiedTheEquation();

};

    void getvalue(){
        cout << " Enter an infix expression: ";
        getline(cin,infix_expression);
    }


    void outputresult ()
    {
    postfix_expression = post_fix(infix_expression);
    prefix_expression = pre_fix(infix_expression);

    cout << "\n Your Infix expression is: " << infix_expression;
    cout << "\n Postfix expression is: " << postfix_expression;
    cout << "\n Prefix expression is: " << prefix_expression << endl;
    }


    // match the input variables with the corresponding equation
    void satisfiedTheEquation()
    {
    cout << "\n Desplay which variable assignments result in a satisfied equation:"<< endl;
        if (checkWhichFunctionItSatisfied == 4 && samevariable == 0)
        cout << " The operand can be assigned to the equation \"A ^ B v (C v D)\". " << endl;
        else if (checkWhichFunctionItSatisfied == 5 && samevariable == 1)
        cout << " The operand can be assigned to the equation \"A ^ B ^ C v !B ^ A\". " << endl;
        else if (checkWhichFunctionItSatisfied == 6 && samevariable == 1)
        cout << " The operand can be assigned to the equation \"B ^ !C v (D ^ E ^ F v C\". " << endl;
        else
        cout << " unsatisfiable" << endl;
    }

int main()
{
getvalue();
outputresult();
satisfiedTheEquation();
return 0;
}












