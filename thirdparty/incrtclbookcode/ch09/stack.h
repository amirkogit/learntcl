#ifndef STACK_H
#define STACK_H
class Stack
{
  public:
    Stack() {_top = _data;}
    void push(int i_) {*++_top = i_;}
    int pop() {return *_top--;}
    int top() {return *_top;}
  private:
    int _data[10];
    int* _top;
};
#endif
