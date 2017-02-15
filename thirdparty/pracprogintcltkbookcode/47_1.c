/*
 * Example 47-1
 * The initialization procedure for a loadable package.
 */

/*
* random.c
*/
#include <tcl.h>
/*
* Declarations for application-specific command procedures
*/

int RandomCmd(ClientData clientData,
				Tcl_Interp *interp,
				int argc, char *argv[]);
int RandomObjCmd(ClientData clientData,
				Tcl_Interp *interp,
				int objc, Tcl_Obj *CONST objv[]);

/*
* Random_Init is called when the package is loaded.
*/

int Random_Init(Tcl_Interp *interp) {
	/*
	 * Initialize the stub table interface, which is
	 * described in Chapter 46.
	 */

	if (Tcl_InitStubs(interp, "8.1", 0) == NULL) {
		return TCL_ERROR;
	}
	/*
	 * Register two variations of random.
	 * The orandom command uses the object interface.
	 */

	Tcl_CreateCommand(interp, "random", RandomCmd,
			(ClientData)NULL, (Tcl_CmdDeleteProc *)NULL);
	Tcl_CreateObjCommand(interp, "orandom", RandomObjCmd,
			(ClientData)NULL, (Tcl_CmdDeleteProc *)NULL);

	/*
	 * Declare that we implement the random package
	 * so scripts that do "package require random"
	 * can load the library automatically.
	 */
	Tcl_PkgProvide(interp, "random", "1.1");
	return TCL_OK;
}


