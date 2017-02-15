/*
 * Example 47-13
 * A canonical Tcl main program and Tcl_AppInit.
 */

/* main.c */
#include <tcl.h>
int Tcl_AppInit(Tcl_Interp *interp);
/*
* Declarations for application-specific command procedures
*/
int Plus1ObjCmd(ClientData clientData,
				Tcl_Interp *interp,
				int objc, Tcl_Obj *CONST objv[]);

main(int argc, char *argv[]) {
	/*
	 * Initialize your application here.
	 *
	 * Then initialize and run Tcl.
	 */
	Tcl_Main(argc, argv, Tcl_AppInit);
	exit(0);
}
/*
* Tcl_AppInit is called from Tcl_Main
* after the Tcl interpreter has been created,
* and before the script file
* or interactive command loop is entered.
*/
int
Tcl_AppInit(Tcl_Interp *interp) {
	/*
	 * Tcl_Init reads init.tcl from the Tcl script library.
	 */
	if (Tcl_Init(interp) == TCL_ERROR) {
		return TCL_ERROR;
	}
	/*
	 * Register application-specific commands.
	 */
	Tcl_CreateObjCommand(interp, "plus1", Plus1ObjCmd,
			(ClientData)NULL, (Tcl_CmdDeleteProc *)NULL);
	Random_Init(interp);
	Blob_Init(interp);
	/*
	 * Define the start-up filename. This file is read in
	 * case the program is run interactively.
	 */
	Tcl_SetVar(interp, "tcl_rcFileName", "~/.mytcl",
		TCL_GLOBAL_ONLY);
	/*
	 * Test of Tcl_Invoke, which is defined on page 691.
	 */
	Tcl_Invoke(interp, "set", "foo", "$xyz [foo] {", NULL);
	return TCL_OK;
}


