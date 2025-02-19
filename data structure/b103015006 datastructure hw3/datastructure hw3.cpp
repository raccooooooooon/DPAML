/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>
#include <stack>
#include <algorithm>
#include <string>
using namespace std;


    class node
    {   //define the initial node that would be used in other classes
        public:
          char value;
          node *left;
          node *right;
          node *next = NULL;
          node (char c)
          {//Create a tree node where its left and right are null, and the value is c
            this->value = c;
            left = NULL;
            right = NULL;
          }
          node ()
          {//create a tree node where its left and right are null without value
            left = NULL;
            right = NULL;
          }
          friend class Stack;
          friend class expression_tree;
          friend class Sort;
          ~node(){};//destructor
    };

    class Stack
    {
      node *head = NULL;

        public:
          void push (node*); // define push function
          node *pop (); // define pop function
          friend class expression_tree;
          friend class Sort;
          ~Stack(){}; //destructor
        };

    class Sort
    {
        public:
         node *u, *v, *w, *x, *y, *z; // temperary variables

         void postfixConvertion(string input, Stack stack) //post-fix sort
        {
            int length = input.length ();
            for (int i = 0; i < length; i++)
                {
                  if (input[i] == '+' || input[i] == '-' || input[i] == '*' || input[i] == '/' )
                	{// If a character is an operator,pop two values from the stack make them its child and push the current node again

                        	  x = stack.pop ();
                        	  y = stack.pop ();
                        	  z = new node (input[i]);
                        	  z->right = x;
                        	  z->left = y;
                        	  //childrens of the node are operand
                        	  stack.push (z);
                        	  //make the tree we just operate be the children of the next node
                    	}

                  else
                	{// If a character is an operand, directly push that into the stack
                	  z = new node (input[i]);
                	  stack.push (z);
                	}

                    // minimum convertion
                    z = stack.pop();

                    if ((z->value == '*' || z->value == '/') && (z->right->value == '+' || z->right->value == '-'))
                    	    {// commutative law, if '*' or '/' are above '+' and '-'

                            	y = z->right;
                            	x = z->left;
                            	w = new node (z->value); // w = '*' or '/'

                        	    if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                        	    {//special case: if the left and right children of the node are all operator

                            	    u= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                            	    u->left = new node (w->value);
                            	    u->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                            	    //pop and push to have a brand new minimum tree
                            	    //we compile the tree as left children and right children, then connect them together

                            	    u->left->left = x->left;
                            	    u->left->right = y->left;//origin right children (*or/) by (left children of the left children)

                            	    u->right->left = x->right;
                            	    u->right->right = y->left;


                            	    v= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                            	    v->left = new node (w->value);
                            	    v->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                               	    v->left->left = x->left;
                            	    v->left->right = y->right;//origin left children (*or/) by (right children of the left children)

                            	    v->right->left = x->right;
                            	    v->right->right = y->right;

                            	    z= new node('+');
                            	    z->left = u;
                            	    z->right = v;
                        	    }

                    	        else
                    	        {// right case: if the right children of the node is operator, and the left children of the node is operand

                            	    z= new node (y->value); // build a new node which value of the tree become its right children(+or-)
                            	    z->left = new node (w->value);
                            	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                            	    //pop and push to operate a new minimum tree
                            	    z->left->left = x;
                            	    z->left->right = y->left;//origin left children (*or/) by (right children of the left children)

                            	    z->right->left = x;
                            	    z->right->right = y->right;
                    	        }

                    	    }
                    	else if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                    	    {// left case: if the left children of the node is operator, and the right children of the node is oprand

                        	    y = z->right;
                        	    x = z->left;
                        	    w = new node (z->value);// w = '*' or '/'

                        	    //pop and push to operate a new minimum tree
                        	    z= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                        	    z->left = new node (w->value);
                        	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                        	    z->left->left = x->left;
                        	    z->left->right = y;//origin right children (*or/) by (left children of the left children)

                        	    z->right->left = x->right;
                        	    z->right->right = y;

                    	    }


                    	//distributive law
                        //if the node is '-', and the right children is '+' or '-', then we distribute it by converting the sign
                        if (z->value == '-' && z->right->value == '+')
                            z->right->value = '-';
                        else if (z->value == '-' && z->right->value == '-')
                            z->right->value = '+';

                    stack.push(z);//push back the minimize node
                }

        }

         void prefixConvertion(string input, Stack stack) //pre-fix sort
        {
            int length = input.length ();
            for (int i = 0; i < length; i++)
                {
                  if (input[length-1-i] == '+' || input[length-1-i] == '-' || input[length-1-i] == '*' || input[length-1-i] == '/' )
                	    {
                	        // read the input from back to front, which is similar to post-fix
                	        // If a character is an operator pop two values from the stack make them its child and push the current node again

                        	  x = stack.pop ();
                        	  y = stack.pop ();
                        	  z = new node (input[length-1-i]);
                        	  z->right = x;
                        	  z->left = y;
                        	  //children of the node are operand
                        	  stack.push (z);
                        	  //make the tree we just be the children of next node

                    	}

                  else
                	{// If a character is an operand, directly push that into the stack
                	  z = new node (input[length-1-i]);
                	  stack.push (z);
                	}

                    // minimum convertion
                    z = stack.pop();


                    	if ((z->value == '*' || z->value == '/') && (z->right->value == '+' || z->right->value == '-'))
                    	    {// commutative law, if '*' or '/' are above '+' and '-'

                            	y = z->right;
                            	x = z->left;
                            	w = new node (z->value);

                        	    if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                        	    {//special case: if the left and right children of the node are all operator

                        	        //pop and push to have a brand new minimum tree
                            	    //we compile the tree as left children and right children, then connect them together

                            	    u= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                            	    u->left = new node (w->value);
                            	    u->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                            	    u->left->left = x->left;
                            	    u->left->right = y->left;//origin right children (*or/) by (left children of the left children)

                            	    u->right->left = x->right;
                            	    u->right->right = y->left;


                            	    v= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                            	    v->left = new node (w->value);
                            	    v->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                               	    v->left->left = x->left;
                            	    v->left->right = y->right;//origin left children (*or/) by (right children of the left children)

                            	    v->right->left = x->right;
                            	    v->right->right = y->right;

                            	    z= new node('+');
                            	    z->left = u;
                            	    z->right = v;
                        	    }

                    	        else
                    	        {// right case: if the right children of the node is operator, and the left children of the node is operand

                            	    z= new node (y->value); // build a new node which value of the tree become its right children(+or-)
                            	    z->left = new node (w->value);
                            	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                            	    //pop and push to operate a new minimum tree
                            	    z->left->left = x;
                            	    z->left->right = y->left;//origin left children (*or/) by (right children of the left children)

                            	    z->right->left = x;
                            	    z->right->right = y->right;
                    	        }
                    	    }

                    	else if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                    	    {// left case: if the left children of the node is operator, and the right children of the node is oprand

                        	    y = z->right;
                        	    x = z->left;
                        	    w = new node (z->value);

                                //pop and push to operate a new minimum tree

                        	    z= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                        	    z->left = new node (w->value);
                        	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                        	    z->left->left = x->left;
                        	    z->left->right = y;//origin right children (*or/) by (left children of the left children)

                        	    z->right->left = x->right;
                        	    z->right->right = y;

                    	    }

                     	//distributive law
                        //if the node is '-', and the right children is '+' or '-', then we distribute it by converting the sign

                        if (z->value == '-' && z->left->value == '+')
                            z->left->value = '-';
                        else if (z->value == '-' && z->left->value == '-')
                            z->left->value = '+';

                        stack.push(z);//push back the minimize node
                }
        }

         void infixConvertion(string input, Stack stack) //in-fix sort
        {
            int length = input.length ();
            for (int i = 0; i < length; i++)
                {

                    if (input[i] != '*' && input[i] != '/' && input[i] != '+' && input[i] != '-' && input[i] != '(' && input[i] != ')')
                    {//if input is operand

                        if ( (input[i-1] == '+' || input[i-1] == '-' || input[i-1] == '*' || input[i-1] == '/') && (input[i-2] !=')' ) )
                        {
                            // if the previous input is operator, and the input is not in the type (something)(operator)(operand)(operator/input(something)
                            //pop the previous node (operator) and the node before it and recombined into a node

                            w = stack.pop();
                            v = stack.pop();
                            z = new node (w->value);
                            z->left = v;
                            z-> right = new node (input[i]);
                            stack.push(z);
                        }
                        else
                        {
                            //store into the stack
                            z = new node (input[i]);
                            stack.push(z);
                        }
                    }

                    else if (input[i] == '*' || input[i] == '/' || input[i] == '+' || input[i] == '-' || input[i] == ')'  )
                    {   //store the operand into the stack, neglect '('
                        z = new node (input[i]);
                    	stack.push (z);
                    }



                        //minimize

                          if ( input[i] == ')' && ( input[i-1] != ')' && input[i-1] != '(' && input[i-1] != '+' && input[i-1] != '-' && input[i-1] != '*' && input[i-1] != '/'  ))
                          {// if the input is '(' and the previous input is operand

                              if ( (input[i-2] == '+' || input[i-2] =='-' ) && ( input[i-3] != ')' && input[i-3] != '(' && input[i-3] != '+' && input[i-3] != '-' && input[i-3] != '*' && input[i-3] != '/'  ) && (input[i-4] == '(') && (input[i-5] == '*' || input[i-5] == '/'))
                              //  operand-> ('+'or'-) -> operand-> ')'
                              {
                                  if ( ( input[i-6] != ')' || input[i-6] != '(' || input[i-6] != '+' || input[i-6] != '-' || input[i-6] != '*' || input[i-6] != '/'  ) && (input[i-7] == '*' || input[i-7] == '/') && input[i-8] == ')')
                                  {
                                      // (c-d)/e*(a+b) type
                                      stack.pop();      // delete ')'
                                      u = stack.pop();  // u = node a+b
                                      v = stack.pop();  // v = operator * or /
                                      w = stack.pop();  // w = operand e
                                      x = stack.pop();  // x = operator / or *
                                      stack.pop();      // delete ')'
                                      y = stack.pop();  // y = node c-d

                                      //create a new tree

                                      z = new node (u->value);
                                      z->left = new node (y->value);
                                      z->right = new node (y->value);

                                      z->left->left = new node (v->value);
                                      z->left->right = new node (v->value);
                                      z->right->left = new node (v->value);
                                      z->right->right = new node (v->value);

                                      z->left->left->left = new node (x->value);
                                      z->left->left->right = u->left;
                                      z->left->right->left = new node (x->value);
                                      z->left->right->right = u->left;
                                      z->right->left->left = new node (x->value);
                                      z->right->left->right = u->right;
                                      z->right->right->left = new node (x->value);
                                      z->right->right->right = u->right;

                                      z->left->left->left->left = y->left;
                                      z->left->left->left->right = new node (w->value);

                                      z->left->right->left->left = y->right;
                                      z->left->right->left->right = new node (w->value);

                                      z->right->left->left->left = y->left;
                                      z->right->left->left->right = new node (w->value);

                                      z->right->right->left->left = y->right;
                                      z->right->right->left->right = new node (w->value);

                                      stack.push(z);

                                  }
                                  /*else if
                                  {
                                      // a*(b+c) type
                                      stack.pop();      // delete ')'
                                      u = stack.pop();  // u = node b+c
                                      v = stack.pop();  // v = operator * or /
                                      w = stack.pop();  // w = oprand a

                                      z = new node (u->value);
                                      z->left = new node (v->value);
                                      z->right = new node (v->value);

                                      z->left->right = u->left;
                                      z->left->left = new node (w->value);

                                      z->right->right = u->right;
                                      z->right->left = new node (w->value);

                                      stack.push(z);
                                  }*/
                              }

                          }

                           else if ( (input[i] != '*' && input[i] != '/' && input[i] != '+' && input[i] != '-' && input[i] != ')' && input[i]!= '(') && input[i+2] != '(' )
                          //for the case multiply after parameter (something)*operand or (something)/operand
                          {

                              if ( (input[i-1] == '*' || input[i-1] =='/') && input[i-2] == ')' )
                                // (something)* type
                              {

                                  y = stack.pop(); //operand
                                  w = stack.pop();  // w= operand (i-1): *or/
                                  v = stack.pop();  // v = )
                                  x = stack.pop();  // x = node : +or-

                                  z = new node (x->value);
                                  z->left = new node (w->value);
                                  z->right = new node (w->value);

                                  //create a new tree
                                  z->left->left = x->left;
                                  z->left->right = new node (y->value);

                                  z->right->left = x->right;
                                  z->right->right = new node (y->value);

                                  stack.push(z);
                              }

                          }

                }
        }

          friend class expression_tree;
          ~Sort(){};//destructor
    };

    class expression_tree
    {//print out the tree

        public:
          void post_inorder (node * z)
          {//for post-fix, read the tree from left to right
            if (z == NULL)
            return;
            else {
            post_inorder(z->left);
            cout << z->value << "  ";
            post_inorder(z->right);
        }
          }
          void pre_inorder (node * z)
          {//for pre-fix, read the tree from right to left (opposite direction of post-fix)
            if (z == NULL)
            return;
            else {
            pre_inorder(z->right);
            cout << z->value << "  ";
            pre_inorder(z->left);
        }
          }
        void in_inorder (node * z)
          {//for in-fix, read the tree from left to right
            if (z == NULL)
            return;
            else {
            post_inorder(z->left);
            cout << z->value << "  ";
            post_inorder(z->right);
        }
          }
          ~expression_tree(){};
    };

    void Stack::push (node * x)
    {
      if (head == NULL)
        {
          head = x;
        }
      else
        {// We are inserting here nodes at the top of the stack [following LIFO principle]
          x->next = head;
          head = x;
        }
    }

    node *Stack::pop ()
    {
      // Popping out the top most[ pointed with head] element
      node *p = head;
      head = head->next;
      return p;
    }

    int main ()
    {
      string input;
      cout << "Insert The Equation: " << endl;
      cin >> input;
      //store the input equation

      string type;
      cout << "Tell the sequence type: (in-fix, post-fix, or pre-fix)"<< endl;
      cin >> type;
      //define the type

      Stack stack;
      expression_tree tree;
      Sort sort;
      cout << "The Inorder Traversal of Expression Tree: ";

      if (type == "post-fix"){
            sort.postfixConvertion(input, stack);
            tree.post_inorder (sort.z);
      }
      else if (type == "pre-fix"){
            sort.prefixConvertion(input, stack);
            tree.pre_inorder(sort.z);
      }
      else if (type == "in-fix"){
            sort.infixConvertion(input, stack);
            tree.in_inorder(sort.z);
      }

      return 0;
    }

