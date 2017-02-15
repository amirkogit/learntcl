/*
 * Example 47-8
 * The BlobCmd command procedure.
 */

/*
* BlobCmd --
*
*		This implements the blob command, which has these
*		subcommands:
*			create
*			command name ?script?
*			data name ?value?
*			N name ?value?
*			names ?pattern?
*			poke name
*			delete name
*
*	Results:
*		A standard Tcl command result.
*/
int
BlobCmd(ClientData data, Tcl_Interp *interp,
	int objc, Tcl_Obj *CONST objv[])
{
	BlobState *statePtr = (BlobState *)data;
	Blob *blobPtr;
	Tcl_HashEntry *entryPtr;
	Tcl_Obj *valueObjPtr;

	/*
	 * The subCmds array defines the allowed values for the
	* first argument. These are mapped to values in the
	* BlobIx enumeration by Tcl_GetIndexFromObj.
	*/

	char *subCmds[] = {
		"create", "command", "data", "delete", "N", "names",
		"poke", NULL
	};
	enum BlobIx {
		CreateIx, CommandIx, DataIx, DeleteIx, NIx, NamesIx,
		PokeIx 
	};
	int result, index;

	if (objc == 1 || objc > 4) {
		Tcl_WrongNumArgs(interp, 1, objv, "option ?arg ...?");
		return TCL_ERROR;
	}
	if (Tcl_GetIndexFromObj(interp, objv[1], subCmds,
			"option", 0, &index) != TCL_OK) {
		return TCL_ERROR;
	}
	if (((index == NamesIx || index == CreateIx) && 
			(objc > 2)) ||
		((index == PokeIx || index == DeleteIx) &&
			(objc == 4))) {
		Tcl_WrongNumArgs(interp, 1, objv, "option ?arg ...?");
		return TCL_ERROR;
	}
	if (index == CreateIx) {
		return BlobCreate(interp, statePtr);
	}
	if (index == NamesIx) {
		return BlobNames(interp, statePtr);
	}
	if (objc < 3) {
		Tcl_WrongNumArgs(interp, 1, objv, 
			"option blob ?arg ...?");
		return TCL_ERROR;
	} else if (objc == 3) {
		valueObjPtr = NULL;
	} else {
		valueObjPtr = objv[3];
	}
	/*
	 * The rest of the commands take a blob name as the third
	 * argument. Hash from the name to the Blob structure.
	 */
	entryPtr = Tcl_FindHashEntry(&statePtr->hash,
			Tcl_GetString(objv[2]));
	if (entryPtr == NULL) {
		Tcl_AppendResult(interp, "Unknown blob: ",
				Tcl_GetString(objv[2]), NULL);
		return TCL_ERROR;
	}
	blobPtr = (Blob *)Tcl_GetHashValue(entryPtr);
	switch (index) {
		case CommandIx: {
			return BlobCommand(interp, blobPtr, valueObjPtr);
		}
		case DataIx: {
			return BlobData(interp, blobPtr, valueObjPtr);
		}
		case NIx: {
			return BlobN(interp, blobPtr, valueObjPtr);
		}
		case PokeIx: {
			return BlobPoke(interp, blobPtr);
		}
		case DeleteIx: {
			return BlobDelete(blobPtr, entryPtr);
		}
	}
}


