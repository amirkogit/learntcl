/*
 * Example 49-11
 * The Tk_OptionSpec typedef.
 */

typedef struct Tk_OptionSpec {
	Tk_OptionType type;
	char *optionName;
	char *dbName;
	char *dbClass;
	char *defValue;
	int objOffset;
	int internalOffset;
	int flags;
	ClientData clientData;
	int typeMask;
} Tk_OptionSpec;


