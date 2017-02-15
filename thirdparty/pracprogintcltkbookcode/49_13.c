/*
 * Example 49-13
 * ComputeGeometry computes the widget\" s size.
 */

static void
ComputeGeometry(Clock *clockPtr)
{
	int width, height;
	Tk_FontMetrics fm;							/* Font size information */
	struct tm *tmPtr;							/* Time info split into fields */
	struct timeval tv;							/* BSD-style time value */
	int bd;							/* Padding from borders */
	char clock[1000];							/* Displayed time */

	/*
	 * Get the time and format it to see how big it will be.
	 */
	gettimeofday(&tv, NULL);
	tmPtr = localtime(&tv.tv_sec);
	strftime(clock, 1000, clockPtr->format, tmPtr);
	if (clockPtr->clock != NULL) {
	    ckfree(clockPtr->clock);
	}
	clockPtr->clock = ckalloc(1+strlen(clock));
	clockPtr->numChars = strlen(clock);

	bd = clockPtr->highlightWidth + clockPtr->borderWidth;
	Tk_GetFontMetrics(clockPtr->tkfont, &fm);
	height = fm.linespace + 2*(bd + clockPtr->padY);
	Tk_MeasureChars(clockPtr->tkfont, clock,
		clockPtr->numChars, 0, 0, &clockPtr->textWidth);
	width = clockPtr->textWidth + 2*(bd + clockPtr->padX);

	Tk_GeometryRequest(clockPtr->tkwin, width, height);
	Tk_SetInternalBorder(clockPtr->tkwin, bd);
}


