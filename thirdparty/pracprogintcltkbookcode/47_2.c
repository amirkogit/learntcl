/*
 * Example 47-2
 * The RandomCmd C command procedure.
 */

/*
* RandomCmd --
* This implements the random Tcl command. With no arguments
* the command returns a random integer.
* With an integer valued argument "range",
* it returns a random integer between 0 and range.
*/
int
RandomCmd(ClientData clientData, Tcl_Interp *interp,
		int argc, char *argv[])
{
	int rand, error;
	int range = 0;
	if (argc > 2) {
		interp->result = "Usage: random ?range?";
		return TCL_ERROR;
	}
	if (argc == 2) {
		if (Tcl_GetInt(interp, argv[1], &range) != TCL_OK) {
			return TCL_ERROR;
		}
	}
	rand = random();
	if (range != 0) {
		rand = rand % range;
	}
	sprintf(interp->result, "%d", rand);
	return TCL_OK;
}


