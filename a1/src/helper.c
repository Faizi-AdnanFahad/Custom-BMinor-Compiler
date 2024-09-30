#include <stdlib.h>
#include <string.h>
#include "../include/helper.h"

/* You may use this file to add any helper functions you need. */

extern char *yytext; // Actual text scanned
extern char ESCAPE_CODE[];
extern char ESCAPE_BYTE[]; 

void process_string_literal() {
  int len = strlen(yytext);
  char* copy = malloc(len * sizeof(char));
  strcpy(copy, yytext);
  strip_qoutes(copy);
  special_char_to_byte(copy);
  strcpy(yytext, copy);
  free(copy);
}

void process_char_literal() {
  int len = strlen(yytext);
  char* copy = malloc(len * sizeof(char));
  strcpy(copy, yytext);
  strip_qoutes(copy);
  strcpy(yytext, copy);
  free(copy);
}
// if we find a // in the string followed by an escape code, let's replace with the byte character
void special_char_to_byte(char* str) {
  int len = strlen(str);
  for(int i = 0; i < len; ++i) {
    if(i + 1 < len) {
      for(int j = 0; j < 11; ++j) {
        char code = ESCAPE_CODE[j]; 
        if(str[i] == '\\' && str[i + 1] == code)  {
          // replace the slash with the newline byte
          str[i] = ESCAPE_BYTE[j];
          // shift left from the right side
          shift_left(str, i + 1);
        }
      }
    }
  }
}

void shift_left(char* str, int at) {
  int len = strlen(str);
  for(int i = at; i < len; ++i) str[i] = str[i + 1];
}

void strip_tail(char* str) {
  int len = strlen(str);
  str[len - 1] = '\0';
}

void strip_qoutes(char* str) {
  strip_tail(str);
  shift_left(str, 0);
}
