/*
 * Example 49-7
 * ClockConfigure allocates resources for the widget.
 */

static int
ClockConfigure(interp, clockPtr, argc, argv, flags)
	Tcl_Interp *interp;	/* For return values and errors */
	Clock *clockPtr;					/* The per-instance data structure */
	int argc;					/* Number of valid entries in argv */
	char *argv[];					/* The command line arguments */
	int flags;					/* Tk_ConfigureWidget flags */
{
	XGCValues gcValues;
	GC newGC;

	/*
	 * Tk_ConfigureWidget parses the command line arguments
	 * and looks for defaults in the resource database.
	 */
	if (Tk_ConfigureWidget(interp, clockPtr->tkwin,
			configSpecs, argc, argv, (char *) clockPtr, flags)
				!= TCL_OK) {
		return TCL_ERROR;
	}
	/*
	 * Give the widget a default background so it doesn\" t get
	 * a random background between the time it is initially
	 * displayed by the X server and we paint it
	 */
	Tk_SetWindowBackground(clockPtr->tkwin,
		Tk_3DBorderColor(clockPtr->background)->pixel);
	/*
	 * Set up the graphics contexts to display the widget.
	 * The context is used to draw off-screen pixmaps,
	 * so turn off exposure notifications.
	 */
	gcValues.background = 
		Tk_3DBorderColor(clockPtr->background)->pixel;
	gcValues.foreground = clockPtr->foreground->pixel;
	gcValues.font = Tk_FontId(clockPtr->tkfont);
	gcValues.graphics_exposures = False;
	newGC = Tk_GetGC(clockPtr->tkwin,
		GCBackground|GCForeground|GCFont|GCGraphicsExposures,
		&gcValues);
	if (clockPtr->textGC != None) {
	    Tk_FreeGC(clockPtr->display, clockPtr->textGC);
	}
	clockPtr->textGC = newGC;
	/*
	 * Determine how big the widget wants to be.
	 */
	ComputeGeometry(clockPtr);
	/*
	 * Set up a call to display ourself.
	 */
	if ((clockPtr->tkwin != NULL) &&
		 	 Tk_IsMapped(clockPtr->tkwin)
		 	&& !(clockPtr->flags & REDRAW_PENDING)) {
		Tk_DoWhenIdle(ClockDisplay, (ClientData) clockPtr);
		clockPtr->flags |= REDRAW_PENDING;
	}
	return TCL_OK;
}


