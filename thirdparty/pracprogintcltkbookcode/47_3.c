/*
 * Example 47-3
 * The RandomObjCmd C command procedure.
 */

/*
* RandomObjCmd --
* This implements the random Tcl command from
* Example 45-2 using the object interface.
*/
int
RandomObjCmd(ClientData clientData, Tcl_Interp *interp,
		int objc, Tcl_Obj *CONST objv[])
{
	Tcl_Obj *resultPtr;
	int rand, error;
	int range = 0;
	if (objc > 2) {
		Tcl_WrongNumArgs(interp, 1, objv, "?range?");
		return TCL_ERROR;
	}
	if (objc == 2) {
		if (Tcl_GetIntFromObj(interp, objv[1], &range) != 
				TCL_OK) {
			return TCL_ERROR;
		}
	}
	rand = random();
	if (range != 0) {
		rand = rand % range;
	}
	resultPtr = Tcl_GetObjResult(interp);
	Tcl_SetIntObj(resultPtr, rand);
	return TCL_OK;
}


