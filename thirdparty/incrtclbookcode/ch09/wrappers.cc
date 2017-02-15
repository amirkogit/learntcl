#include "itcl.h"
#include "stack.h"

extern "C" {
  int NewStackCmd(ClientData, Tcl_Interp*, int, char**);
  int DeleteStackCmd(ClientData, Tcl_Interp*, int, char**);
  int PushCmd(ClientData, Tcl_Interp*, int, char**);
  int PopCmd(ClientData, Tcl_Interp*, int, char**);
  int TopCmd(ClientData, Tcl_Interp*, int, char**);
  Stack* getStackPointer(Tcl_Interp*, char*);
  int Stack_Init(Tcl_Interp*);
};

static Tcl_HashTable objects;

int NewStackCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  /*
   * This static variable is used to create unique keys for hash
   * table entries.  Each key will be the string "stack" with this
   * static variable appended to it.
   */
  static unsigned int id = 1;

  int returnVal;            /* Return value for Tcl_CreateHashEntry */
  Tcl_HashEntry* entryPtr;  /* New entry pointer in the hash table  */
  Stack* newStackPtr;       /* Pointer to a new C++ Stack object    */

  /*
   * Generate a unique key.  Post-increment the id so that the next
   * key will be different.
   */
  sprintf(interp->result,"stack%u",id++);

  /*
   * Create a new entry in the hash table with the unique key name.
   */
  entryPtr =
    Tcl_CreateHashEntry(&objects, interp->result, &returnVal);

  if (!returnVal)
  {
    Tcl_AppendResult(interp,
      "Failed to create hash entry.", (char*)NULL);
    return TCL_ERROR;
  }

  /* Create the new Stack object and store it in the hash table. */
  newStackPtr = new Stack();
  Tcl_SetHashValue(entryPtr,newStackPtr);

  /*
   * This is the mechanism used to determine which C++ Stack object
   * maps to which [incr Tcl] Stack object.  By storing the key in
   * a class data member, Stack methods are able to operate on the
   * correct Stack by searching through the hash table for an entry
   * that matches the key from the current [incr Tcl] object.
   */
  Tcl_SetVar(interp,"_object",interp->result,TCL_NAMESPACE_ONLY);

  return TCL_OK;
};


int DeleteStackCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  /*
   * Get the C++ object name from the [incr Tcl] class data
   * member, _object.  The C++ object name is the key used
   * to search in the hash table.
   */
  char* name = Tcl_GetVar(interp,"_object",TCL_NAMESPACE_ONLY);
  if (!name)
  {
    Tcl_AppendResult(interp, "Failed to get contents of variable,",
      " _object.", (char *)NULL);
    return TCL_ERROR;
  }

  /* 
   * Find the hash table entry corresponding to the object name.
   */
  Stack* stack = getStackPointer(interp,name);
  if (stack)
  {
    delete(stack);
    Tcl_AppendResult(interp, "C++ object successfully deleted.",
      (char *)NULL);
    return TCL_OK;
  }
  else
  {
    Tcl_AppendResult(interp, "Failed to get C++ object from the ",
      "hash table.", (char *)NULL);
    return TCL_ERROR;
  }
};


int PushCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  /*
   * Make sure the number of arguments is correct first.
   */
  if (argc != 2)
  {
    Tcl_AppendResult(interp, "wrong * args: should be \"push #\"",
      (char *)NULL);
    return TCL_ERROR;
  }

  /*
   * Get the C++ object name from the [incr Tcl] class data
   * member, _object.  The C++ object name is the key used
   * to search in the hash table.
   */
  char* name = Tcl_GetVar(interp,"_object",TCL_NAMESPACE_ONLY);
  if (!name)
  {
    Tcl_AppendResult(interp, "Failed to get contents of variable,",
      " _object.", (char *)NULL);
    return TCL_ERROR;
  }

  /* 
   * Find the hash table entry corresponding to the object name.
   */
  Stack* stack = getStackPointer(interp,name);
  if (stack)
  {
    /*
     * Found the entry.  Now convert the argument to an integer.
     */
    int num;
    Tcl_GetInt(interp,argv[1],&num);
    if (!num)
    {
      Tcl_AppendResult(interp, "Failed to convert the specified ",
        "argument, ", argv[1], " to an integer value.", (char *)NULL);
      return TCL_ERROR;
    }

    /*
     * Use the C++ object pointer to push the designated number
     * onto the stack.
     */
/*    if (!isInt(num))
    {
    Tcl_AppendResult(interp, "Please specify an integer value.",
      (char *)NULL);
      return TCL_ERROR;
    }
*/
    stack->push(num);
    Tcl_AppendResult(interp, "C++ object successfully updated.",
      (char *)NULL);
    return TCL_OK;
  }
  else
  {
    Tcl_AppendResult(interp, "Failed to get C++ object from the ",
      "hash table.", (char *)NULL);
    return TCL_ERROR;
  }
};


int PopCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  /*
   * Get the C++ object name from the [incr Tcl] class data
   * member, _object.  The C++ object name is the key used
   * to search in the hash table.
   */
  char* name = Tcl_GetVar(interp,"_object",TCL_NAMESPACE_ONLY);
  if (!name)
  {
    Tcl_AppendResult(interp, "Failed to get contents of variable,",
      " _object.", (char *)NULL);
    return TCL_ERROR;
  }

  /* 
   * Find the hash table entry corresponding to the object name.
   */
  Stack* stack = getStackPointer(interp,name);
  if (stack)
  {
    /*
     * Found the entry.  Now ask the C++ object to remove the top
     * entry on the stack.
     */
    stack->pop();
    Tcl_AppendResult(interp, "C++ object successfully updated.",
      (char *)NULL);
    return TCL_OK;
  }
  else
  {
    Tcl_AppendResult(interp, "Failed to get C++ object from the ",
      "hash table.", (char *)NULL);
    return TCL_ERROR;
  }
};


int TopCmd(
  ClientData cdata,
  Tcl_Interp* interp,
  int argc, char** argv)
{
  /*
   * Get the C++ object name from the [incr Tcl] class data
   * member, _object.  The C++ object name is the key used
   * to search in the hash table.
   */
  char* name = Tcl_GetVar(interp,"_object",TCL_NAMESPACE_ONLY);
  if (!name)
  {
    Tcl_AppendResult(interp, "Failed to get contents of variable,",
      " _object.", (char *)NULL);
    return TCL_ERROR;
  }

  /* 
   * Find the hash table entry corresponding to the object name.
   */
  Stack* stack = getStackPointer(interp,name);
  if (stack)
  {
    /*
     * Found the entry.  Now ask the C++ object for the top entry
     * on the stack.
     */
    int val = stack->top();
    sprintf(interp->result,"%d",val);
    /*Tcl_AppendResult(interp, interp->result, (char *)NULL);*/
    return TCL_OK;
  }
  else
  {
    Tcl_AppendResult(interp, "Failed to get C++ object from the ",
      "hash table.", (char *)NULL);
    return TCL_ERROR;
  }
};


Stack* getStackPointer(Tcl_Interp* interp, char *key)
{
  /*
   * Locate the entry in the hash table corresponding to the
   * designated key.  This key is stored in the [incr Tcl] object.
   */
  Tcl_HashEntry* entryPtr;
  entryPtr = Tcl_FindHashEntry(&objects, key);
  if (entryPtr == NULL)
  {
    Tcl_AppendResult(interp, "Failed to locate C++ object",
      (char *)NULL);
    return (Stack *)TCL_ERROR;
  }

  return (Stack *)Tcl_GetHashValue(entryPtr);
};


int Stack_Init(Tcl_Interp* interp)
{
  if (Itcl_RegisterC(interp,
        "createNewStack", (Tcl_CmdProc*)NewStackCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK ||

      Itcl_RegisterC(interp,
        "deleteStack", (Tcl_CmdProc*)DeleteStackCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK ||

      Itcl_RegisterC(interp,
        "push", (Tcl_CmdProc*)PushCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK ||

      Itcl_RegisterC(interp,
        "pop", (Tcl_CmdProc*)PopCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK ||

      Itcl_RegisterC(interp,
        "top", (Tcl_CmdProc*)TopCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK)
  {
    return TCL_ERROR;
  }

  Tcl_InitHashTable(&objects,TCL_STRING_KEYS);
  return TCL_OK;
};
