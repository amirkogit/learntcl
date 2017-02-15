/*
 * Example 47-12
 * The BlobCommand and BlobPoke procedures.
 */

int
BlobCommand(Tcl_Interp *interp, Blob *blobPtr, 
	Tcl_Obj *objPtr)
{
	if (objPtr != NULL) {
		if (blobPtr->cmdPtr != NULL) {
			Tcl_DecrRefCount(blobPtr->cmdPtr);
		}
		Tcl_IncrRefCount(objPtr);
		blobPtr->cmdPtr = objPtr;
	}
	if (blobPtr->cmdPtr != NULL) {
		Tcl_SetObjResult(interp, blobPtr->cmdPtr);
	}
	return TCL_OK;
}
int
BlobPoke(Tcl_Interp *interp, Blob *blobPtr)
{
	int result = TCL_OK;
	if (blobPtr->cmdPtr != NULL) {
		Tcl_Preserve(blobPtr);
		result = Tcl_EvalObj(interp, blobPtr->cmdPtr);
		/*
		 * Safe to use blobPtr here
		 */
		Tcl_Release(blobPtr);
		/*
		 * blobPtr may not be valid here
		 */
	}
	return result;
}


