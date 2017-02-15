/*
 * Example 47-5
 * The Plus1ObjCmd procedure.
 */

/*
* Plus1ObjCmd --
* This adds one to its input argument.
*/
int
Plus1ObjCmd(ClientData clientData, Tcl_Interp *interp,
		int objc, Tcl_Obj *CONST objv[])
{
	Tcl_Obj *objPtr;
	int i;
	if (objc != 2) {
		Tcl_WrongNumArgs(interp, 1, objv, "value");
		return TCL_ERROR;
	}
	objPtr = objv[1];
	if (Tcl_GetIntFromObj(interp, objPtr, &i) != TCL_OK) {
		return TCL_ERROR;
	}
	if (Tcl_IsShared(objPtr)) {
		objPtr = Tcl_DuplicateObj(objPtr);											/* refCount 0 */
		Tcl_IncrRefCount(objPtr);											/* refCount 1*/
	}
	/*
	 * Assert objPtr has a refCount of one here.
	 * OK to set the unshared value to something new.
	 * Tcl_SetIntObj overwrites the old value.
	 */
	Tcl_SetIntObj(objPtr, i+1);
	/*
	 * Setting the result object adds a new reference,
	 * so we decrement because we no longer care about
	 * the integer object we modified.
	 */
	Tcl_SetObjResult(interp, objPtr);												/* refCount 2*/
	Tcl_DecrRefCount(objPtr);												/* refCount 1*/
	/*
	 * Now only the interpreter result has a reference to objPtr.
	 */
	return TCL_OK;
}


