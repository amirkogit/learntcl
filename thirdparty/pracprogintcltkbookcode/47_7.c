/*
 * Example 47-7
 * The Blob_Init and BlobCleanup procedures.
 */

/*
* Forward references.
*/

int BlobCmd(ClientData data, Tcl_Interp *interp,
		int objc, Tcl_Obj *CONST objv[]);
int BlobCreate(Tcl_Interp *interp, BlobState *statePtr);
void BlobCleanup(ClientData data);

/*
* Blob_Init --
*
*		Initialize the blob module.
*
* Side Effects:
* 		This allocates the hash table used to keep track
*		of blobs. It creates the blob command.
*/
int 
Blob_Init(Tcl_Interp *interp)
{
	BlobState *statePtr;
	/*
	 * Allocate and initialize the hash table. Associate the
	 * BlobState with the command by using the ClientData.
	 */
	statePtr = (BlobState *)ckalloc(sizeof(BlobState));
	Tcl_InitHashTable(&statePtr->hash, TCL_STRING_KEYS);
	statePtr->uid = 0;
	Tcl_CreateObjCommand(interp, "blob", BlobCmd, 
			(ClientData)statePtr, BlobCleanup);
	return TCL_OK;
}
/*
* BlobCleanup --
*		This is called when the blob command is destroyed.
*
* Side Effects:
*		This walks the hash table and deletes the blobs it
*		contains. Then it deallocates the hash table.
*/
void
BlobCleanup(ClientData data)
{
	BlobState *statePtr = (BlobState *)data;
	Blob *blobPtr;
	Tcl_HashEntry *entryPtr;
	Tcl_HashSearch search;

	entryPtr = Tcl_FirstHashEntry(&statePtr->hash, &search);
	while (entryPtr != NULL) {
		blobPtr = Tcl_GetHashValue(entryPtr);
		BlobDelete(blobPtr, entryPtr);
		/*
		 * Get the first entry again, not the "next" one,
		 * because we just modified the hash table.
		 */
		entryPtr = Tcl_FirstHashEntry(&statePtr->hash, &search);
	}
	ckfree((char *)statePtr);
}


