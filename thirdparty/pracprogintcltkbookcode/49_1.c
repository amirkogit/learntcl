/*
 * Example 49-1
 * The Clock_Init procedure.
 */

int ClockCmd(ClientData clientData,
				Tcl_Interp *interp,
				int argc, char *argv[]);
int ClockObjCmd(ClientData clientData,
				Tcl_Interp *interp,
				int objc, Tcl_Obj *CONST objv[]);
void ClockObjDelete(ClientData clientData);

/*
* Clock_Init is called when the package is loaded.
*/

int Clock_Init(Tcl_Interp *interp) {
	if (Tcl_InitStubs(interp, "8.1", 0) == NULL) {
		return TCL_ERROR;
	}
	Tcl_CreateCommand(interp, "wclock", ClockCmd,
			(ClientData)NULL, (Tcl_CmdDeleteProc *)NULL);
	Tcl_CreateObjCommand(interp, "oclock", ClockObjCmd,
			(ClientData)NULL, ClockObjDelete);
	Tcl_PkgProvide(interp, "Tkclock", "1.0");
	return TCL_OK;
}


