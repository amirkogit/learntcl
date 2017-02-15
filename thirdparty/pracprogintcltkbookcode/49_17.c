/*
 * Example 49-17
 * The ClockObjDelete command.
 */

void
ClockObjDelete(ClientData clientData)
{
	Tk_OptionTable optionTable = (Tk_OptionTable) clientData;
	if (optionTable != NULL) {
		Tk_DeleteOptionTable(optionTable);
	}
}


