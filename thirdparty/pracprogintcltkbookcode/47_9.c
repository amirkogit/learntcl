/*
 * Example 47-9
 * BlobCreate and BlobDelete.
 */

int
BlobCreate(Tcl_Interp *interp, BlobState *statePtr)
{
	Tcl_HashEntry *entryPtr;
	Blob *blobPtr;
	int new;
	char name[20];
	/*
	 * Generate a blob name and put it in the hash table
	 */
	statePtr->uid++;
	sprintf(name, "blob%d", statePtr->uid);
	entryPtr = Tcl_CreateHashEntry(&statePtr->hash, name, &new);
	/*
	 * Assert new == 1 
	 */
	blobPtr = (Blob *)ckalloc(sizeof(Blob));
	blobPtr->N = 0;
	blobPtr->objPtr = NULL;
	blobPtr->cmdPtr = NULL;
	Tcl_SetHashValue(entryPtr, (ClientData)blobPtr);
	/*
	 * Copy the name into the interpreter result.
	 */
	Tcl_SetStringObj(Tcl_GetObjResult(interp), name, -1);
	return TCL_OK;
}
int
BlobDelete(Blob *blobPtr, Tcl_HashEntry *entryPtr)
{
	Tcl_DeleteHashEntry(entryPtr);
	if (blobPtr->cmdPtr != NULL) {
		Tcl_DecrRefCount(blobPtr->cmdPtr);
	}
	if (blobPtr->objPtr != NULL) {
		Tcl_DecrRefCount(blobPtr->objPtr);
	}
	/*
	 * Use Tcl_EventuallyFree because of the Tcl_Preserve
	 * done in BlobPoke. See page 682.
	 */
	Tcl_EventuallyFree((char *)blobPtr, Tcl_Free);
	return TCL_OK;
}


