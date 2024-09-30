#ifndef HELPER_H
#define HELPER_H

/* Add function prototypes here for functions defined in helper.c */

// Some string methods.. pain in the ass
void process_string_literal();
void process_char_literal();
void special_char_to_byte(char* str);
void shift_left(char* str, int at);
void strip_tail(char* str);
void strip_qoutes(char* str);
#endif
