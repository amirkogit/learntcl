/*
 * Example 49-8
 * ClockObjConfigure allocates resources for the widget.
 */

static int
ClockObjConfigure(interp, clockPtr, objc, objv)
	Tcl_Interp *interp;	/* For return values and errors */
	Clock *clockPtr;					/* The per-instance data structure */
	int objc;					/* Number of valid entries in argv */
	Tcl_Obj *objv[];					/* The command line arguments */
{
	XGCValues gcValues;
	GC newGC;
	Tk_SavedOptions savedOptions;
	int mask, error;
	Tcl_Obj *errorResult;

	/*
	 * The first time through this loop we set the 
	 * configuration from the command line inputs. The second
	 * pass is used to restore the configuration in case of
	 * errors
	 */
	for (error = 0 ; error <= 1 ; error++) {
		if (!error) {
			/*
			 * Tk_SetOptions parses the command arguments
			 * and looks for defaults in the resource
			 * database.
			 */
			if (Tk_SetOptions(interp, (char *) clockPtr,
					clockPtr->optionTable, objc, objv,
					clockPtr->tkwin, &savedOptions,
					&mask) != TCL_OK) {
				continue;
			}
		} else {
			/*
			 * Restore options from saved values
			 */
			errorResult = Tcl_GetObjResult(interp);
			Tcl_IncrRefCount(errorResult);
			Tk_RestoreSavedOptions(&savedOptions);
		}
		if (mask & GRAPHICS_MASK) {
			/*
			 * Give the widget a default background so it doesn\" t
			 * get a random background between the time it is 
			 * initially displayed by the system and we paint it
			 */
			Tk_SetBackgroundFromBorder(clockPtr->tkwin, 
					clockPtr->background);
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
		}
		/*
		 * Determine how big the widget wants to be.
		 */
		if (mask & GEOMETRY_MASK) {
			ComputeGeometry(clockPtr);
		}
		/*
		 * Set up a call to display ourself.
		 */
		if ((clockPtr->tkwin != NULL) &&
			 	 Tk_IsMapped(clockPtr->tkwin)
			 	&& !(clockPtr->flags & REDRAW_PENDING)) {
			Tk_DoWhenIdle(ClockDisplay,
				(ClientData) clockPtr);
			clockPtr->flags |= REDRAW_PENDING;
		}
		/*
		 * All OK, break out and avoid error rollback.
		 */
		break;
	}
	if (!error) {
		Tk_FreeSavedOptions(&savedOptions);
		return TCL_OK;
	} else {
		Tcl_SetObjResult(interp, errorResult);
		Tcl_DecrRefCount(errorResult);
		return TCL_ERROR;
	}
}


