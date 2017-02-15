/*
 * Example 49-14
 * The ClockDisplay procedure.
 */

static void
ClockDisplay(ClientData clientData)
{
	Clock *clockPtr = (Clock *)clientData;
	Tk_Window tkwin = clockPtr->tkwin;
	GC gc;							/* Graphics Context for highlight */
	Tk_TextLayout layout;							/* Text measurement state */
	Pixmap pixmap;							/* Temporary drawing area */
	int offset, x, y;							/* Coordinates */
	int width, height;							/* Size */
	struct tm *tmPtr;							/* Time info split into fields */
	struct timeval tv;							/* BSD-style time value */

	/*
	 * Make sure the clock still exists
	 * and is mapped onto the display before painting.
	 */
	clockPtr->flags &= ~(REDRAW_PENDING|TICKING);
	if ((clockPtr->tkwin == NULL) || !Tk_IsMapped(tkwin)) {
		return;
	}
	/*
	 * Format the time into a string.
	 * localtime chops up the time into fields.
	 * strftime formats the fields into a string.
	 */
	gettimeofday(&tv, NULL);
	tmPtr = localtime(&tv.tv_sec);
	strftime(clockPtr->clock, clockPtr->numChars+1, 
		clockPtr->format, tmPtr);
	/*
	 * To avoid flicker when the display is updated, the new
	 * image is painted in an offscreen pixmap and then 
	 * copied onto the display in one operation. Allocate the
	 * pixmap and paint its background.
	 */
	pixmap = Tk_GetPixmap(clockPtr->display,
		Tk_WindowId(tkwin), Tk_Width(tkwin),
		Tk_Height(tkwin), Tk_Depth(tkwin));
	Tk_Fill3DRectangle(tkwin, pixmap, 
		clockPtr->background, 0, 0, Tk_Width(tkwin),
		Tk_Height(tkwin), 0, TK_RELIEF_FLAT);

	/*
	 * Paint the text first.
	 */
	layout = Tk_ComputeTextLayout(clockPtr->tkfont, 
		clockPtr->clock, clockPtr->numChars, 0,
		TK_JUSTIFY_CENTER, 0, &width, &height);
	x = (Tk_Width(tkwin) - width)/2;
	y = (Tk_Height(tkwin) - height)/2;
	Tk_DrawTextLayout(clockPtr->display, pixmap,
		clockPtr->textGC, layout, x, y, 0, -1);

	/*
	 * Display the borders, so they overwrite any of the
	 * text that extends to the edge of the display.
	 */
	if (clockPtr->relief != TK_RELIEF_FLAT) {
		Tk_Draw3DRectangle(tkwin, pixmap,
			clockPtr->background,
			clockPtr->highlightWidth,
			clockPtr->highlightWidth,
			Tk_Width(tkwin) - 2*clockPtr->highlightWidth,
			Tk_Height(tkwin) - 2*clockPtr->highlightWidth,
			clockPtr->borderWidth, clockPtr->relief);
	}
	if (clockPtr->highlightWidth != 0) {
		GC gc;

		/*
		 * This GC is associated with the color, and Tk caches
		 * the GC until the color is freed. Hence no freeGC.
		 */

		if (clockPtr->flags & GOT_FOCUS) {
			gc = Tk_GCForColor(clockPtr->highlight, pixmap);
		} else {
			gc = Tk_GCForColor(clockPtr->highlightBg, pixmap);
		}
		Tk_DrawFocusHighlight(tkwin, gc, 
			clockPtr->highlightWidth, pixmap);
	}
	/*
	 * Copy the information from the off-screen pixmap onto
	 * the screen, then delete the pixmap.
	 */
    
	XCopyArea(clockPtr->display, pixmap, Tk_WindowId(tkwin),
		clockPtr->textGC, 0, 0, Tk_Width(tkwin),
		Tk_Height(tkwin), 0, 0);
	Tk_FreePixmap(clockPtr->display, pixmap);

	/*
	 * Queue another call to ourselves. The rate at which
	 * this is done could be optimized.
	 */
	clockPtr->token = Tk_CreateTimerHandler(1000, 
		ClockDisplay, (ClientData)clockPtr);
	clockPtr->flags |= TICKING;
}


