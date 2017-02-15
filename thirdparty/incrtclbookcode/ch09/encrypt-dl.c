/*
 * This file includes versions of EncipherCmd, DecipherCmd, and
 * Encrypt_Init for the first example on dynamic loading.
 */

#include "itcl.h"

const int minAscii = 32;         /* Smallest valid ASCII value: ' ' */
const int maxAscii = 126;        /* Largest valid ASCII value : '~' */
const int maxLen   = 128;        /* Longest string length allowed   */
const char* key    = "j3o:h1n6"; /* Transposition key               */


int EncipherCmd(cdata, interp, objc, objv)
  ClientData cdata;       /* required but usually not used */
  Tcl_Interp *interp;     /* pointer to the interpreter    */
  int objc;               /* number of arguments           */
  Tcl_Obj *CONST objv[];  /* array of argument strings     */
{
  int index;              /* Index into the plaintext               */
  int keyIndex = 0;       /* Index into the key                     */
  char* ciphertext;       /* Encrypted string buffer                */
  char* stringToEncrypt;  /* User-designated string to be encrypted */

  /*
   * Make sure the correct number of arguments is specified.
   * Syntax = <objectName methodName "string to be encrypted">
   */
  if (objc != 2)
  {
    Tcl_WrongNumArgs(interp, 1, objv, "string-to-encrypt");
    return TCL_ERROR;
  }

  /*
   * Extract the user-designated string to be encrypted from the
   * Tcl_Obj array.
   */
  stringToEncrypt = Tcl_GetStringFromObj(objv[1], (int*)NULL);

  /*
   * Return if the length of the string to be encrypted is greater  
   * than the maximum allowed # of characters or if it's zero length.
   */
  if (strlen(stringToEncrypt) > maxLen)
  {
    char buf[5];
    sprintf(buf,"%d",maxLen);
    Tcl_AppendResult(interp, "specified string is too long: ",
      "must not exceed ", buf, " characters", (char *)NULL);
    return TCL_ERROR;
  }
  else if (strlen(stringToEncrypt) == 0)
  {
    Tcl_AppendResult(interp, "specified string is zero length",
      (char *)NULL);
    return TCL_ERROR;
  }

  /*
   * Allocate memory for the ciphertext string.
   */
  ciphertext = Tcl_Alloc(maxLen+1);

  /*
   * This algorithm is a slight derivation of the Vigenere
   * cipher.  Parse over each character in the specified string
   * and use a simple transposition cipher against the key to
   * calculate the encrypted character.  This resulting character
   * is then modified to fit into the valid ASCII range of 32-126
   * so that the character is readable/printable.
   */
  for (index=0; index < strlen(stringToEncrypt); index++)
  {
    ciphertext[index] =
      (char)((((int)key[keyIndex] + (int)stringToEncrypt[index]) %
               (maxAscii-minAscii+1)) + minAscii);

    /* When the end of the key is reached, wrap back to the front. */
    if (keyIndex==strlen(key)-1)
      keyIndex=0;
    else
      keyIndex++;
  }

  /* Null terminate the encrypted string. */
  ciphertext[index]='\0';

  Tcl_AppendResult(interp, ciphertext, (char *)NULL);
  Tcl_Free(ciphertext);
  return TCL_OK;
}


int DecipherCmd(cdata, interp, objc, objv)
  ClientData cdata;       /* required but usually not used */
  Tcl_Interp *interp;     /* pointer to the interpreter    */
  int objc;               /* number of arguments           */
  Tcl_Obj *CONST objv[];  /* array of argument strings     */
{
  int index;              /* Index into the plaintext               */
  int keyIndex = 0;       /* Index into the key                     */
  char* plaintext;        /* Decrypted string buffer                */
  char* stringToDecrypt;  /* User-designated string to be decrypted */
  
  /*
   * Make sure the correct number of arguments is specified.
   * Syntax = <objectName methodName "string to be decrypted">
   */
  if (objc != 2)
  {
    Tcl_WrongNumArgs(interp, 1, objv, "string-to-decrypt");
    return TCL_ERROR;
  }

  /*
   * Extract the user-designated string to be decrypted from the
   * Tcl_Obj array.
   */
  stringToDecrypt = Tcl_GetStringFromObj(objv[1], (int*)NULL);

  /*
   * Return if the length of the string to be decrypted is greater  
   * than the maximum allowed # of characters or if it's zero length.
   */
  if (strlen(stringToDecrypt) > maxLen)
  {
    char buf[5];
    sprintf(buf,"%d",maxLen);
    Tcl_AppendResult(interp, "specified string is too long: ",
      "must not exceed ", buf, " characters", (char *)NULL);
    return TCL_ERROR;
  }
  else if (strlen(stringToDecrypt) == 0)
  {
    Tcl_AppendResult(interp, "specified string is zero length",
      (char *)NULL);
    return TCL_ERROR;
  }

  /*
   * Allocate memory for the plaintext string.
   */
  plaintext = Tcl_Alloc(maxLen+1);

  for (index=0; index < strlen(stringToDecrypt); index++)
  {
    /*
     * This algorithm is the inverse of the encryption.
     */
    plaintext[index] =
      (char)(((int)stringToDecrypt[index] - minAscii +
              (maxAscii-minAscii+1)) - (int)key[keyIndex]);

    /*
     * If the new character is out of the ASCII range, then
     * recalculate.
     */
    if ((int)plaintext[index] < minAscii)
    {
      plaintext[index] =
       (char)((stringToDecrypt[index] - minAscii +
               (2*(maxAscii-minAscii+1))) - (int)key[keyIndex]);
    }
    else if ((int)plaintext[index] > maxAscii)
    {
      plaintext[index] =
       (char)(stringToDecrypt[index] - minAscii - (int)key[keyIndex]);
    }

    /* When the end of the key is reached, wrap back to the front. */
    if (keyIndex==strlen(key)-1)
      keyIndex=0;
    else
      keyIndex++;
  }

  /* Null terminate the decrypted string. */
  plaintext[index]='\0';

  Tcl_AppendResult(interp, plaintext, (char *)NULL);
  Tcl_Free(plaintext);
  return TCL_OK;
}


int Encrypt_Init(interp)
  Tcl_Interp* interp;
{
  if (Itcl_RegisterObjC(interp,
        "encipher", (Tcl_ObjCmdProc*)EncipherCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK ||

      Itcl_RegisterObjC(interp,
        "decipher", (Tcl_ObjCmdProc*)DecipherCmd,
        (ClientData)NULL, (Tcl_CmdDeleteProc*)NULL) != TCL_OK)
  {
    return TCL_ERROR;
  }
  return TCL_OK;
}
