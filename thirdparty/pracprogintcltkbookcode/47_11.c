/*
 * Example 47-11
 * The BlobN and BlobData procedures.
 */

int
BlobN(Tcl_Interp *interp, Blob *blobPtr, Tcl_Obj *objPtr)
{
	int N;
	if (objPtr != NULL) {
		if (Tcl_GetIntFromObj(interp, objPtr, &N) != TCL_OK) {
			return TCL_ERROR;
		}
		blobPtr->N = N;
	} else {
		N = blobPtr->N;
	}
	Tcl_SetObjResult(interp, Tcl_NewIntObj(N));
	return TCL_OK;
}
int
BlobData(Tcl_Interp *interp, Blob *blobPtr, Tcl_Obj *objPtr)
{
	if (objPtr != NULL) {
		if (blobPtr->objPtr != NULL) {
			Tcl_DecrRefCount(blobPtr->objPtr);
		}
		Tcl_IncrRefCount(objPtr);
		blobPtr->objPtr = objPtr;
	}
	if (blobPtr->objPtr != NULL) {
		Tcl_SetObjResult(interp, blobPtr->objPtr);
	}
	return TCL_OK;
}


