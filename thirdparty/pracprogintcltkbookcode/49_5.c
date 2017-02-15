/*
 * Example 49-5
 * The ClockInstanceCmd command procedure.
 */

static int
ClockInstanceCmd(clientData, interp, argc, argv)
	ClientData clientData;						/* A pointer to a Clock struct */
	Tcl_Interp *interp;						/* The interpreter */
	int argc;						/* The number of arguments */
	char *argv[];						/* The command line arguments */
{
	Clock *clockPtr = (Clock *)clientData;
	int result = TCL_OK;
	char c;
	int len;
	if (argc < 2) {
		Tcl_AppendResult(interp, "wrong # args: should be \"",
			argv[0], " option ?arg arg ...?\"", (char *) NULL);
		return TCL_ERROR;
	}
	c = argv[1][0];
	len = strlen(argv[1]);
	if ((c == \" c\" ) && (strncmp(argv[1], "cget", len) == 0)
			&& (len >= 2)) {
		if (argc != 3) {
			Tcl_AppendResult(interp,
				 "wrong # args: should be \"",
				argv[0], " cget option\"",
				(char *) NULL);
			return TCL_ERROR;
		}
		result = Tk_ConfigureValue(interp, clockPtr->tkwin,
			 configSpecs, (char *) clockPtr, argv[2], 0);
	} else if ((c == \" c\" ) && (strncmp(argv[1], "configure", len) 
				== 0) && (len >= 2)) {
		if (argc == 2) {
			/*
			 * Return all configuration information.
			 */
			result = Tk_ConfigureInfo(interp, clockPtr->tkwin,
				configSpecs, (char *) clockPtr,
				(char *) NULL,0);
		} else if (argc == 3) {
			/*
			 * Return info about one attribute, like cget.
			 */
			result = Tk_ConfigureInfo(interp, clockPtr->tkwin,
				configSpecs, (char *) clockPtr, argv[2], 0);
		} else {
			/*
			 * Change one or more attributes.
			 */
			result = ClockConfigure(interp, clockPtr, argc-2,
				argv+2,TK_CONFIG_ARGV_ONLY);
		}
	} else {
		Tcl_AppendResult(interp, "bad option \"", argv[1],
			"\": must be cget, configure, position, or size",
			(char *) NULL);
		return TCL_ERROR;
	}
	return result;
}


