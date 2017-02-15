/*
 * Example 49-15
 * The ClockEventProc handles window events.
 */

static void
ClockEventProc(ClientData clientData, XEvent *eventPtr)
{
	Clock *clockPtr = (Clock *) clientData;
	if ((eventPtr->type == Expose) &&
		(eventPtr->xexpose.count == 0)) {
			goto redraw;
	} else if (eventPtr->type == DestroyNotify) {
		Tcl_DeleteCommandFromToken(clockPtr->interp, 
				clockPtr->widgetCmd);
		/*
		 * Zapping the tkwin lets the other procedures
		 * know we are being destroyed.
		 */
		clockPtr->tkwin = NULL;

		if (clockPtr->flags & REDRAW_PENDING) {
			Tk_CancelIdleCall(ClockDisplay,
				(ClientData) clockPtr);
			clockPtr->flags &= ~REDRAW_PENDING;
		}
		if (clockPtr->flags & TICKING) {
			Tk_DeleteTimerHandler(clockPtr->token);
			clockPtr->flags &= ~TICKING;
		}
		/*
		 * This results in a call to ClockDestroy.
		 */
		Tk_EventuallyFree((ClientData) clockPtr,
			ClockDestroy);
	} else if (eventPtr->type == FocusIn) {
		if (eventPtr->xfocus.detail != NotifyPointer) {
			clockPtr->flags |= GOT_FOCUS;
			if (clockPtr->highlightWidth > 0) {
				goto redraw;
			}
		}
	} else if (eventPtr->type == FocusOut) {
		if (eventPtr->xfocus.detail != NotifyPointer) {
			clockPtr->flags &= ~GOT_FOCUS;
			if (clockPtr->highlightWidth > 0) {
				goto redraw;
			}
		}
	}
	return;
redraw:
	if ((clockPtr->tkwin != NULL) &&
			!(clockPtr->flags & REDRAW_PENDING)) {
		Tk_DoWhenIdle(ClockDisplay, (ClientData) clockPtr);
		clockPtr->flags |= REDRAW_PENDING;
	}
}


