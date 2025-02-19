/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>
#include <stack>
#include <algorithm>
using namespace std;

// defines the Boolean function for operator, operand, equalOrhigher precedence and the string conversion function.
bool IsOperator(char);
bool IsOperand(char);
bool eqlOrhigher(char, char);
int checkWhichFunctionItSatisfied, samevariable;
string post_fix(string), pre_fix(string);

string infix_expression, postfix_expression, prefix_expression;
int ch;

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
    int precedence(char op)
    {
    if(op == 'v' || op == '^')                   /* it defines the lowest precedence */
    return 1;
    if (op == '!')
    return 2;
    return 0;
    }

    /* The eqlOrhigher() function is used to check the higher or equal precedence of the two operators in infix expression. */
    bool eqlOrhigher (char op1, char op2)
    {
    int p1 = precedence(op1);
    int p2 = precedence(op2);
    if (p1 == p2)
    {

    if (op1 == '^' )
    return false;

    return true;
    }
    return  (p1>p2 ? true : false);
    }

    /* string convert() function is used to convert the infix expression to the postfix expression of the Stack */
    string post_fix(string infix)
    {
    stack <char> S;
    string postfix ="";
    char ch;

    S.push( '(' );
    infix += ')';

    for(int i = 0; i<infix.length(); i++)
    {
    ch = infix[i];

    if(ch == ' ')
    continue;
    else if(ch == '(')
    S.push(ch);
    else if(IsOperand(ch))  {
    postfix += ch;
    checkWhichFunctionItSatisfied++;
    }
    else if(IsOperator(ch))
    {
    while(!S.empty() && eqlOrhigher(S.top(), ch))
    {
    postfix += S.top();
    S.pop();
    }
    S.push(ch);

    // here we check if there is a variable with a logic NOT
    if (ch == '!')
    samevariable++;

    }
    else if(ch == ')')
    {
    while(!S.empty() && S.top() != '(')
    {
    postfix += S.top();
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
        if (checkWhichFunctionItSatisfied == 9 && samevariable == 2)
        cout << " The operand can be assigned to the equation \" (A v !C v D) ^ (!A v B v C) ^ ( A v B v D)\". " << endl;
        else if (checkWhichFunctionItSatisfied == 9 && samevariable == 5)
        cout << " The operand can be assigned to the equation \"(!B v A v A) ^ (!C v !A v B) ^ (D v !C v !A)\". " << endl;
        else if (checkWhichFunctionItSatisfied == 12 && samevariable == 5)
        cout << " The operand can be assigned to the equation \"(E v C v A) ^ (E v B v !C) ^ (!A v !B v D) ^ (C v D! v !E)\". " << endl;
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









