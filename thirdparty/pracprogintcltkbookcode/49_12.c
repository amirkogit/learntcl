/*
 * Example 49-12
 * The Tk_OptionSpec structure for the clock widget.
 */

#define GEOMETRY_MASK 0X1
#define GRAPHICS_MASK 0X2

static Tk_OptionSpec optionSpecs[] = {
	{TK_OPTION_BORDER, "-background", "background",
		"Background", "light blue", -1,
		Tk_Offset(Clock, background), 0, 
		(ClientData) "white", GRAPHICS_MASK},
	{TK_OPTION_SYNONYM, "-bg", "background", (char *) NULL,
		(char *) NULL, -1, 0, 0, 0, 0},
	{TK_OPTION_PIXELS, "-borderwidth", "borderWidth",
		"BorderWidth", "2", Tk_Offset(Clock, borderWidthPtr),
		Tk_Offset(Clock, borderWidth), 
		0, 0, GEOMETRY_MASK},
	{TK_OPTION_SYNONYM, "-bd", "borderWidth", (char *) NULL,
		(char *) NULL, -1, 0, 0, 0, 0},
	{TK_OPTION_RELIEF, "-relief", "relief", "Relief",
		"ridge", -1, Tk_Offset(Clock, relief), 0, 0, 0},
	{TK_OPTION_COLOR, "-foreground", "foreground",
		"Foreground", "black",-1, Tk_Offset(Clock, foreground),
		0, (ClientData) "black", GRAPHICS_MASK},
	{TK_OPTION_SYNONYM, "-fg", "foreground", (char *) NULL,
		(char *) NULL, -1, 0, 0, 0, 0},
	{TK_OPTION_COLOR, "-highlightcolor", "highlightColor",
		"HighlightColor", "red",-1, Tk_Offset(Clock, highlight),
		0, (ClientData) "black", GRAPHICS_MASK},
	{TK_OPTION_COLOR, "-highlightbackground", 
		"highlightBackground", "HighlightBackground",
		"light blue",-1, Tk_Offset(Clock, highlightBg),
		0, (ClientData) "white", GRAPHICS_MASK},
	{TK_OPTION_PIXELS, "-highlightthickness",
		"highlightThickness","HighlightThickness",
		"2", Tk_Offset(Clock, highlightWidthPtr),
		Tk_Offset(Clock, highlightWidth), 0, 0,
		GEOMETRY_MASK},
	{TK_OPTION_PIXELS, "-padx", "padX", "Pad",
		"2", Tk_Offset(Clock, padXPtr),
		Tk_Offset(Clock, padX), 0, 0, GEOMETRY_MASK},
	{TK_OPTION_PIXELS, "-pady", "padY", "Pad",
		"2", Tk_Offset(Clock, padYPtr),
		Tk_Offset(Clock, padY), 0, 0, GEOMETRY_MASK},
	{TK_OPTION_STRING, "-format", "format", "Format",
		"%H:%M:%S",-1, Tk_Offset(Clock, format), 0, 0,
		GEOMETRY_MASK},
	{TK_OPTION_FONT, "-font", "font", "Font",
		"Courier 18",
		-1, Tk_Offset(Clock, tkfont), 0, 0, 
		(GRAPHICS_MASK|GEOMETRY_MASK)},
	{TK_OPTION_END, (char *) NULL, (char *) NULL,
		 (char *) NULL, (char *) NULL, -1, 0, 0, 0, 0}
};


