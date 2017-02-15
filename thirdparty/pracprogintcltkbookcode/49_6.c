/*
 * Example 49-6
 * The ClockInstanceObjCmd command procedure.
 */

static int
ClockInstanceObjCmd(clientData, interp, objc, objv)
	ClientData clientData;						/* A pointer to a Clock struct */
	Tcl_Interp *interp;						/* The interpreter */
	int objc;						/* The number of arguments */
	Tcl_Obj *objv[];						/* The command line arguments */
{
	Clock *clockPtr = (Clock *)clientData;
	char *commands[] = {"cget", "configure", NULL};
	enum command {CLOCK_CGET, CLOCK_CONFIGURE};
	int result;
	Tcl_Obj *objPtr;
	int index;

	if (objc < 2) {
		Tcl_WrongNumArgs(interp, 1, objv, 
			"option ?arg arg ...?");
		return TCL_ERROR;
	}
	result = Tcl_GetIndexFromObj(interp, objv[1], commands,
			"option", 0, &index);
	if (result != TCL_OK) {
		return result;
	}
	switch (index) {
		case CLOCK_CGET: {
			if (objc != 3) {
				Tcl_WrongNumArgs(interp, 1, objv, 
					"cget option");
				return TCL_ERROR;
			}
			objPtr = Tk_GetOptionValue(interp, 
					(char *)clockPtr,
					clockPtr->optionTable,
					(objc == 3) ? objv[2] : NULL,
					clockPtr->tkwin);
			if (objPtr == NULL) {
				return TCL_ERROR;
			} else {
				Tcl_SetObjResult(interp, objPtr);
			}
			break;
		}
		case CLOCK_CONFIGURE: {
			if (objc <= 3) {
				/*
				 * Return one item if the option is given,
				 * or return all configuration information.
				 */
				objPtr = Tk_GetOptionInfo(interp,
						(char *) clockPtr,
						clockPtr->optionTable,
						(objc == 3) ? objv[2] : NULL,
						clockPtr->tkwin);
				if (objPtr == NULL) {
					return TCL_ERROR;
				} else {
					Tcl_SetObjResult(interp, objPtr);
				}
			} else {
				/*
				 * Change one or more attributes.
				 */
				result = ClockObjConfigure(interp, clockPtr, 
					objc-2, objv+2);
			}
		}
	}
	return TCL_OK;
}


