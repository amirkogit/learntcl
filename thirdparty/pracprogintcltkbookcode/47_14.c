/*
 * Example 47-14
 * A canonical Tk main program and Tk_AppInit.
 */

/* main.c */
#include <tk.h>

int Tk_AppInit(Tcl_Interp *interp);

/*
 * A table for command line arguments.
 */
char *myoption1 = NULL;
int myint2 = 0;

static Tk_ArgvInfo argTable[] = {
	{"-myoption1", TK_ARGV_STRING, (char *) NULL,
		(char *) &myoption1, "Explain myoption1"},
	{"-myint2", TK_ARGV_CONSTANT, (char *) 1, (char *) &myint2,
		"Explain myint2"},
	{"", TK_ARGV_END, },
};

main(int argc, char *argv[]) {
	Tcl_Interp *interp;

	/*
	 * Create an interpreter for the error message from
	 * Tk_ParseArgv. Another one is created by Tk_Main.
	 * Parse our arguments and leave the rest to Tk_Main.
	 */

	interp = Tcl_CreateInterp();
	if (Tk_ParseArgv(interp, (Tk_Window) NULL, &argc, argv,
			argTable, 0) != TCL_OK) {
		fprintf(stderr, "%s\n", interp->result);
		exit(1);
	}
	Tcl_DeleteInterp(interp);

	Tk_Main(argc, argv, Tk_AppInit);
	exit(0);
}
int ClockCmd(ClientData clientData,
				Tcl_Interp *interp,
				int argc, char *argv[]);
int ClockObjCmd(ClientData clientData,
				Tcl_Interp *interp,
				int objc, Tcl_Obj *CONST objv[]);
void ClockObjDestroy(ClientData clientData);

int
Tk_AppInit(Tcl_Interp *interp) {
	/*
	 * Initialize packages
	 */
	if (Tcl_Init(interp) == TCL_ERROR) {
		return TCL_ERROR;
	}
	if (Tk_Init(interp) == TCL_ERROR) {
		return TCL_ERROR;
	}
	/*
	 * Define application-specific commands here.
	 */
	Tcl_CreateCommand(interp, "wclock", ClockCmd,
		(ClientData)Tk_MainWindow(interp),
		(Tcl_CmdDeleteProc *)NULL);
	Tcl_CreateObjCommand(interp, "oclock", ClockObjCmd,
		(ClientData)NULL, ClockObjDestroy);

	/*
	 * Define start-up filename. This file is read in
	 * case the program is run interactively.
	 */
	Tcl_SetVar(interp, "tcl_rcFileName", "~/.mytcl",
		TCL_GLOBAL_ONLY);
	return TCL_OK;
}


