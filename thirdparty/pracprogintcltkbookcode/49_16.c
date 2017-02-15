/*
 * Example 49-16
 * The ClockDestroy cleanup procedure.
 */

static void
ClockDestroy(clientData)
	ClientData clientData;		/* Info about entry widget. */
{
	register Clock *clockPtr = (Clock *) clientData;
 
	/*
	 * Free up all the stuff that requires special handling,
	 * then let Tk_FreeOptions handle resources associated
	 * with the widget attributes.
	 */
	if (clockPtr->textGC != None) {
		Tk_FreeGC(clockPtr->display, clockPtr->textGC);
	}
	if (clockPtr->clock != NULL) {
		Tcl_Free(clockPtr->clock);
	}
	if (clockPtr->flags & TICKING) {
		Tk_DeleteTimerHandler(clockPtr->token);
	}
	if (clockPtr->flags & REDRAW_PENDING) {
		Tk_CancelIdleCall(ClockDisplay,
			(ClientData) clockPtr);
	}
	/*
	 * This frees up colors and fonts and any allocated
	 * storage associated with the widget attributes.
	 */
	Tk_FreeOptions(configSpecs, (char *) clockPtr,
		clockPtr->display, 0);
	Tcl_Free((char *) clockPtr);
}


