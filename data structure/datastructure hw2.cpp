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
          void push (node*);
          node *pop ();
          friend class expression_tree;
          friend class Sort;
          ~Stack(){};
        };

    class Sort
    {
        public:
         node *u, *v, *w, *x, *y, *z;
         node *l, *m, *n;
         void postfixConvertion(string input, Stack stack) //post-fix sort
        {
            int length = input.length ();
            for (int i = 0; i < length; i++)
                {
                  if (input[i] == '+' || input[i] == '-' || input[i] == '*' || input[i] == '/' )
                	{// If a character is an operator pop two values from the stack make them its child and push the current node again

                        	  x = stack.pop ();
                        	  y = stack.pop ();
                        	  z = new node (input[i]);
                        	  z->right = x;
                        	  z->left = y;
                        	  //childrens of the node are operand
                        	  stack.push (z);
                        	  //make the tree we just be the children of next node

                    	}

                  else
                	{// If a character is an operand, directly push that into the stack
                	  z = new node (input[i]);
                	  stack.push (z);
                	}


                    z = stack.pop();

                    if ((z->value == '*' || z->value == '/') && (z->right->value == '+' || z->right->value == '-'))
                    	    {// commutative law

                            	y = z->right;
                            	x = z->left;
                            	w = new node (z->value);

                        	    if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                        	    {

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
                    	        {
                            	    z= new node (y->value); // build a new node which value of the tree become its right children(+or-)
                            	    z->left = new node (w->value);
                            	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                            	    z->left->left = x;
                            	    z->left->right = y->left;//origin left children (*or/) by (right children of the left children)

                            	    z->right->left = x;
                            	    z->right->right = y->right;
                    	        }
                    	    }

                    	else if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                    	    {// commutative law
                        	    y = z->right;
                        	    x = z->left;
                        	    w = new node (z->value);

                        	    z= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                        	    z->left = new node (w->value);
                        	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                        	    z->left->left = x->left;
                        	    z->left->right = y;//origin right children (*or/) by (left children of the left children)

                        	    z->right->left = x->right;
                        	    z->right->right = y;

                    	    }


                    	//ditributive law
                        if (z->value == '-' && z->right->value == '+')
                            z->right->value = '-';
                        else if (z->value == '-' && z->right->value == '-')
                            z->right->value = '+';
                    stack.push(z);
                }

        }

         void prefixConvertion(string input, Stack stack) //pre-fix sort
        {
            int length = input.length ();
            for (int i = 0; i < length; i++)
                {
                  if (input[length-1-i] == '+' || input[length-1-i] == '-' || input[length-1-i] == '*' || input[length-1-i] == '/' )
                	    {// If a character is an operator pop two values from the stack make them its child and push the current node again

                        	  x = stack.pop ();
                        	  y = stack.pop ();
                        	  z = new node (input[length-1-i]);
                        	  z->right = x;
                        	  z->left = y;
                        	  //childrens of the node are operand
                        	  stack.push (z);
                        	  //make the tree we just be the children of next node

                    	}

                  else
                	{// If a character is an operand, directly push that into the stack
                	  z = new node (input[length-1-i]);
                	  stack.push (z);
                	}


                    z = stack.pop();


                    	if ((z->value == '*' || z->value == '/') && (z->right->value == '+' || z->right->value == '-'))
                    	    {// commutative law

                            	y = z->right;
                            	x = z->left;
                            	w = new node (z->value);

                        	    if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                        	    {

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
                    	        {
                            	    z= new node (y->value); // build a new node which value of the tree become its right children(+or-)
                            	    z->left = new node (w->value);
                            	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                            	    z->left->left = x;
                            	    z->left->right = y->left;//origin left children (*or/) by (right children of the left children)

                            	    z->right->left = x;
                            	    z->right->right = y->right;
                    	        }
                    	    }

                    	else if ((z->value == '*' || z->value == '/') && (z->left->value == '+' || z->left->value == '-'))
                    	    {// commutative law
                        	    y = z->right;
                        	    x = z->left;
                        	    w = new node (z->value);

                        	    z= new node (x->value); // build a new node which value of the tree become its left children(+or-)
                        	    z->left = new node (w->value);
                        	    z->right = new node (w->value);// value of both left and right children become the origin operator (*or/)

                        	    z->left->left = x->left;
                        	    z->left->right = y;//origin right children (*or/) by (left children of the left children)

                        	    z->right->left = x->right;
                        	    z->right->right = y;

                    	    }

                    	//ditributive law
                        if (z->value == '-' && z->left->value == '+')
                            z->left->value = '-';
                        else if (z->value == '-' && z->left->value == '-')
                            z->left->value = '+';
                        stack.push(z);
                }
        }

         void infixConvertion(string input, Stack stack) //in-fix sort
        {
            int length = input.length ();
            for (int i = 0; i < length; i++)
                {

                    if (input[i] != '*' && input[i] != '/' && input[i] != '+' && input[i] != '-' && input[i] != '(' && input[i] != ')')
                    {//if input is oprand

                        if ( (input[i-1] == '+' || input[i-1] == '-' || input[i-1] == '*' || input[i-1] == '/') && (input[i-2] !=')' ) )
                        {
                            w = stack.pop();
                            v = stack.pop();
                            z = new node (w->value);
                            z->left = v;
                            z-> right = new node (input[i]);
                            stack.push(z);
                        }
                        else
                        {

                            z = new node (input[i]);
                            stack.push(z);
                        }
                    }

                    else if (input[i] == '*' || input[i] == '/' || input[i] == '+' || input[i] == '-' || input[i] == ')'  )
                    {
                        z = new node (input[i]);
                    	stack.push (z);
                    }




                          if ( input[i] == ')' && ( input[i-1] != ')' && input[i-1] != '(' && input[i-1] != '+' && input[i-1] != '-' && input[i-1] != '*' && input[i-1] != '/'  ))
                          {// if the input is '(' and the previoous input is oprand

                              if ( (input[i-2] == '+' || input[i-2] =='-' ) && ( input[i-3] != ')' && input[i-3] != '(' && input[i-3] != '+' && input[i-3] != '-' && input[i-3] != '*' && input[i-3] != '/'  ) && (input[i-4] == '(') && (input[i-5] == '*' || input[i-5] == '/'))
                              //  oprand-> ('+'or'-) -> oprand-> ')'
                              {
                                  if ( ( input[i-6] != ')' || input[i-6] != '(' || input[i-6] != '+' || input[i-6] != '-' || input[i-6] != '*' || input[i-6] != '/'  ) && (input[i-7] == '*' || input[i-7] == '/') && input[i-8] == ')')
                                  {
                                      // (c-d)/e*(a+b) type
                                      cout << "jjjj"<<endl;
                                      l = stack.pop();      // delete ')'
                                      u = stack.pop();  // u = node a+b
                                      v = stack.pop();  // v = operator * or /
                                      w = stack.pop();  // w = oprand e
                                      x = stack.pop();  // x = operator / or *
                                      m = stack.pop();      // delete ')'
                                      y = stack.pop();  // y = node c-d

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
                          //for the case multiply after parameter (something)*oprand or (something)/oprand
                          {

                              if ( (input[i-1] == '*' || input[i-1] =='/') && input[i-2] == ')' ) // (something)* type
                              {

                                  y = stack.pop(); //oprand
                                  w = stack.pop();  // w= oprand (i-1): *or/
                                  v = stack.pop();  // v = )
                                  x = stack.pop();  // x = node : +or-

                                  z = new node (x->value);
                                  z->left = new node (w->value);
                                  z->right = new node (w->value);

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
          ~Sort(){};
    };

    class expression_tree
    {
        public:
          void post_inorder (node * z)
          {
            if (z == NULL)
            return;
            else {
            post_inorder(z->left);
            cout << z->value << "  ";
            post_inorder(z->right);
        }
          }
          void pre_inorder (node * z)
          {
            if (z == NULL)
            return;
            else {
            pre_inorder(z->right);
            cout << z->value << "  ";
            pre_inorder(z->left);
        }
          }
        void in_inorder (node * z)
          {
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
      // We are inserting here nodes at the top of the stack [following LIFO principle]
      else
        {
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
      cout << "Insert The Eqaution: " << endl;
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






