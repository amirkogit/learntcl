/*
 * Example 47-10
 * The BlobNames procedure.
 */

int
BlobNames(Tcl_Interp *interp, BlobState *statePtr)
{
	Tcl_HashEntry *entryPtr;
	Tcl_HashSearch search;
	Tcl_Obj *listPtr;
	Tcl_Obj *objPtr;
	char *name;
	/*
	 * Walk the hash table and build a list of names.
	 */
	listPtr = Tcl_NewListObj(0, NULL);
	entryPtr = Tcl_FirstHashEntry(&statePtr->hash, &search);
	while (entryPtr != NULL) {
		name = Tcl_GetHashKey(&statePtr->hash, entryPtr);
		if (Tcl_ListObjAppendElement(interp, listPtr, 
				Tcl_NewStringObj(name, -1)) != TCL_OK) {
			return TCL_ERROR;
		}
		entryPtr = Tcl_NextHashEntry(&search);
	}
	Tcl_SetObjResult(interp, listPtr);
	return TCL_OK;
}


