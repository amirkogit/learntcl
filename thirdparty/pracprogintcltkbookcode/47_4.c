/*
 * Example 47-4
 * The Tcl_Obj structure.
 */

typedef struct Tcl_Obj {
	int refCount;						/* Counts number of shared references */
	char *bytes;						/* String representation */
	int length;						/* Number of bytes in the string */
	Tcl_ObjType *typePtr;						/* Type implementation */
	union {
		long longValue;					/* Type data */
		double doubleValue;
		VOID *otherValuePtr;
		struct {
			VOID *ptr1;
			VOID *ptr2;
		} twoPtrValue;
	} internalRep;
} Tcl_Obj;


