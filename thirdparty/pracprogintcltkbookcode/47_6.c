/*
 * Example 47-6
 * The Blob and BlobState data structures.
 */

/*
* The Blob structure is created for each blob.
*/
typedef struct Blob {
	int N;						/* Integer-valued property */
	Tcl_Obj *objPtr;						/* General property */
	Tcl_Obj *cmdPtr;						/* Callback script */
} Blob;
/*
* The BlobState structure is created once for each interp.
*/
typedef struct BlobState {
	Tcl_HashTable hash;								/* List blobs by name */
	int uid;								/* Used to generate names */
} BlobState;


