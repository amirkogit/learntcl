#include "itcl.h"

int WorkCmd(cdata, interp, objc, objv)
  ClientData cdata;       /* required but usually not used */
  Tcl_Interp *interp;     /* pointer to the interpreter    */
  int objc;               /* number of arguments           */
  Tcl_Obj *CONST objv[];  /* array of argument strings     */
{
  if (Tcl_Eval(interp, "play") != TCL_OK)
  {
    interp->result = "Cannot play, must work!";
    return TCL_ERROR;
  }

  return TCL_OK;
}

  
int Work_Init(interp)
  Tcl_Interp* interp;
{
  if (Itcl_RegisterObjC(interp,
        "work", (Tcl_ObjCmdProc*)WorkCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK)
  {
    return TCL_ERROR;
  }
  return TCL_OK;
}
