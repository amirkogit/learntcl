/*
 * Example 49-9
 * The Tk_ConfigSpec typedef.
 */

typedef struct Tk_ConfigSpec {
	int type;
	char *name;
	char *dbName;
	char *dbClass;
	char *defValue;
	int offset;
	int specflags;
	Tk_CustomOption *customPtr;
} Tk_ConfigSpec;


