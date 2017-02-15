#include "itcl.h"
#include "stack.h"

extern "C" {
  int NewStackCmd(ClientData, Tcl_Interp*, int, char**);
  int DeleteStackCmd(ClientData);
  int StackCmd(ClientData, Tcl_Interp*, int, char**);
  int Stack_Init(Tcl_Interp*);
};

int NewStackCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  static unsigned int id = 0;
  Stack* newStackPtr = new Stack();

  /*
   * Create a unique string to use for the new Tcl command and
   * then register the new command with the interpreter.
   */
  sprintf(interp->result,"stack%d",id++);
  Tcl_CreateCommand(interp, interp->result,
    (Tcl_CmdProc*)StackCmd, (ClientData)newStackPtr,
    (Tcl_CmdDeleteProc*)DeleteStackCmd);

  return TCL_OK;
};


int DeleteStackCmd(ClientData cdata)
{
  delete (Stack *)cdata;
};


int StackCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  Stack* stack = (Stack *)cdata;

  if (argc < 2)
  {
    interp->result = "wrong # args";
    return TCL_ERROR;
  }

  if (strcmp(argv[1], "push") == 0)
  {
    int val;
    if (Tcl_GetInt(interp,argv[2],&val) != TCL_OK)
    {
      interp->result = "Error converting arg to integer.";
      return TCL_ERROR;
    }
    stack->push(val);
    interp->result = "Successfully pushed value onto C++ stack.";
  }
  else if (strcmp(argv[1], "pop") == 0)
  {
    stack->pop();
    interp->result = "Successfully popped value off of C++ stack.";
  }
  else if (strcmp(argv[1], "top") == 0)
  {
    int top = stack->top();
    sprintf(interp->result,"%d",top);
  }

  return TCL_OK;
};


int Stack_Init(Tcl_Interp* interp)
{
  if (Itcl_RegisterC(interp,
        "createNewStack", (Tcl_CmdProc*)NewStackCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK)
  {
    return TCL_ERROR;
  }

  return TCL_OK;
};
