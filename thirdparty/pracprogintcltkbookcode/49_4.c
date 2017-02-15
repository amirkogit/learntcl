/*
 * Example 49-4
 * The ClockObjCmd command procedure.
 */

int
ClockObjCmd(clientData, interp, objc, objv)
	ClientData clientData;						/* Main window of the app */
	Tcl_Interp *interp;						/* Current interpreter. */
	int objc;						/* Number of arguments. */
	Tcl_Obj **objv;						/* Argument values. */
{
	Tk_OptionTable optionTable;
	Clock *clockPtr;
	Tk_Window tkwin;
 
	if (objc < 2) {
		Tcl_WrongNumArgs(interp, 1, objv, "pathName ?options?");
		return TCL_ERROR;
	}
	optionTable = (Tk_OptionTable) clientData;
	if (optionTable == NULL) {
		Tcl_CmdInfo info;
		char *name;

		/*
		 * Initialize the option table for this widget the
		 * first time a clock widget is created. The option
		 * table is saved as our client data.
		 */
		
		optionTable = Tk_CreateOptionTable(interp, optionSpecs);
		name = Tcl_GetString(objv[0]);
		Tcl_GetCommandInfo(interp, name, &info);
		info.objClientData = (ClientData) optionTable;
		Tcl_SetCommandInfo(interp, name, &info);
	}
	tkwin = Tk_CreateWindowFromPath(interp,
			Tk_MainWindow(interp),
			Tcl_GetString(objv[1]), (char *) NULL);
	if (tkwin == NULL) {
		return TCL_ERROR;
	}
	/*
	 * Set resource class.
	 */
	Tk_SetClass(tkwin, "Clock");
	/*
	 * Allocate and initialize the widget record.
	 */
	clockPtr = (Clock *) ckalloc(sizeof(Clock));
	clockPtr->tkwin = tkwin;
	clockPtr->display = Tk_Display(tkwin);
	clockPtr->interp = interp;
	clockPtr->optionTable = optionTable;
	clockPtr->borderWidth = 0;
	clockPtr->borderWidthPtr = NULL;
	clockPtr->highlightWidth = 0;
	clockPtr->highlightWidthPtr = NULL;
	clockPtr->relief = TK_RELIEF_FLAT;
	clockPtr->background = NULL;
	clockPtr->foreground = NULL;
	clockPtr->highlight = NULL;
	clockPtr->highlightBg = NULL;
	clockPtr->tkfont = NULL;
	clockPtr->textGC = None;
	clockPtr->token = NULL;
	clockPtr->clock = NULL;
	clockPtr->format = NULL;
	clockPtr->numChars = 0;
	clockPtr->textWidth = 0;
	clockPtr->widthPtr = NULL;
	clockPtr->textHeight = 0;
	clockPtr->heightPtr = NULL;
	clockPtr->padX = 0;
	clockPtr->padXPtr = NULL;
	clockPtr->padY = 0;
	clockPtr->padYPtr = NULL;
	clockPtr->flags = 0;
	/*
	 * Register a handler for when the window is
	 * exposed or resized.
	 */
	Tk_CreateEventHandler(clockPtr->tkwin,
		ExposureMask|StructureNotifyMask|FocusChangeMask,
		ClockEventProc, (ClientData) clockPtr);
	/*
	 * Create a Tcl command that operates on the widget.
	 */
	clockPtr->widgetCmd = Tcl_CreateObjCommand(interp,
		Tk_PathName(clockPtr->tkwin),
		ClockInstanceObjCmd,
		(ClientData) clockPtr, (void (*)()) NULL);
	/*
	 * Parse the command line arguments.
	 */
	if ((Tk_InitOptions(interp, (char *)clockPtr, 
			optionTable, tkwin) != TCL_OK) ||
		(ClockObjConfigure(interp, clockPtr,
			 objc-2, objv+2, 0) != TCL_OK)) {
		Tk_DestroyWindow(clockPtr->tkwin);
		return TCL_ERROR;
	}
	Tcl_SetStringObj(Tcl_GetObjResult(interp),
		Tk_PathName(clockPtr->tkwin), -1);
	return TCL_OK;
}


