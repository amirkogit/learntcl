/*
 * Example 49-2
 * The Clock widget data structure.
 */

#include "tk.h"
#include <sys/time.h>

typedef struct {
	Tk_Window tkwin;							/* The window for the widget */
	Display *display;							/* Tk's handle on the display */
	Tcl_Interp *interp;							/* Interpreter of the widget */
	Tcl_Command widgetCmd;							/* clock instance command. */
	Tk_OptionTable optionTable; /* Used to parse options */
	/*
	 * Clock-specific attributes.
	 */
	int borderWidth;							/* Size of 3-D border */
	Tcl_Obj *borderWidthPtr;	/* Original string value */
	int relief;							/* Style of 3-D border */
	Tk_3DBorder background;							/* Color for border & background */
	XColor *foreground;							/* Color for the text */
	XColor *highlight;							/* Color for active highlight */
	XColor *highlightBg;							/* Color for neutral highlight */
	int highlightWidth;							/* Thickness of highlight rim */
	Tcl_Obj *highlightWidthPtr; /* Original string value */
	Tk_Font tkfont;							/* Font info for the text */
	char *format;							/* Format for time string */
	/*
	 * Graphic contexts and other support.
	 */
	GC textGC;							/* Text graphics context */
	Tk_TimerToken token;							/* Periodic callback handle*/
	char *clock;							/* Pointer to the clock string */
	int numChars;							/* length of the text */
	int textWidth;							/* in pixels */
	Tcl_Obj *widthPtr;							/* The original width string value*/
	int textHeight;							/* in pixels */
	Tcl_Obj *heightPtr;							/* The original height string value*/
	int padX;							/* Horizontal padding */
	Tcl_Obj *padXPtr;							/* The original padX string value*/
	int padY;							/* Vertical padding */
	Tcl_Obj *padYPtr;							/* The original padY string value */
	int flags;							/* Flags defined below */
} Clock;
/*
* Flag bit definitions.
*/
#define REDRAW_PENDING							0x1
#define GOT_FOCUS							0x2
#define TICKING							0x4


