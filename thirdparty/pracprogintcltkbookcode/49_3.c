/*
 * Example 49-3
 * The ClockCmd command procedure.
 */

int
ClockCmd(clientData, interp, argc, argv)
	ClientData clientData;						/* Main window of the app */
	Tcl_Interp *interp;						/* Current interpreter. */
	int argc;						/* Number of arguments. */
	char **argv;						/* Argument strings. */
{
	Tk_Window main = (Tk_Window) clientData;
	Clock *clockPtr;
	Tk_Window tkwin;
 
	if (argc < 2) {
		Tcl_AppendResult(interp, "wrong # args: should be \"",
			 argv[0], " pathName ?options?\"", (char *) NULL);
		return TCL_ERROR;
	}
	tkwin = Tk_CreateWindowFromPath(interp, main,
			 argv[1], (char *) NULL);
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
	clockPtr = (Clock *) Tcl_Alloc(sizeof(Clock));
	clockPtr->tkwin = tkwin;
	clockPtr->display = Tk_Display(tkwin);
	clockPtr->interp = interp;
	clockPtr->borderWidth = 0;
	clockPtr->highlightWidth = 0;
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
	clockPtr->textHeight = 0;
	clockPtr->padX = 0;
	clockPtr->padY = 0;
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
	clockPtr->widgetCmd = Tcl_CreateCommand(interp,
		Tk_PathName(clockPtr->tkwin),
		ClockInstanceCmd,
		(ClientData) clockPtr, (void (*)()) NULL);
	/*
	 * Parse the command line arguments.
	 */
	if (ClockConfigure(interp, clockPtr,
			 argc-2, argv+2, 0) != TCL_OK) {
		Tk_DestroyWindow(clockPtr->tkwin);
		return TCL_ERROR;
	}
	interp->result = Tk_PathName(clockPtr->tkwin);
	return TCL_OK;
}


