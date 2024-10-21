%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../include/helper.h"
#include "../include/expr.h"
#include "../include/print.h"

extern char *yytext;
extern int yylex();
int yyerror( char *str);
extern char* parser_result;

%}
%token TOKEN_EOF                            0 // enum index start 0
%token TOKEN_SEMICOLON                      1
%token TOKEN_DIGIT                          2
%token TOKEN_CHARACTER_LITERAL              3
%token TOKEN_INTEGER_ASSINGMENT             4
%token TOKEN_BOOLEAN_ASSIGNMENT 5
%token TOKEN_CHARACTER_ASSIGNMENT 6
%token TOKEN_STRING_ASSIGNMENT 7
%token TOKEN_STRING_LITERAL 8
%token TOKEN_INTEGER_ARRAY 9
%token TOKEN_BOOLEAN_ARRAY 10
%token TOKEN_CHARACTER_ARRAY 11
%token TOKEN_STRING_ARRAY 12
%token TOKEN_ARRAY 13
%token TOKEN_BOOLEAN 14
%token TOKEN_CHAR 15
%token TOKEN_ELSE 16
%token TOKEN_FALSE 17
%token TOKEN_FOR 18
%token TOKEN_FUNCTION 19
%token TOKEN_IF 20
%token TOKEN_INTEGER_LITERAL 21
%token TOKEN_PRINT 22
%token TOKEN_RETURN 23
%token TOKEN_STRING 24
%token TOKEN_TRUE 25
%token TOKEN_VOID 26
%token TOKEN_WHILE 27
%token TOKEN_IDENTIFIER 28
%token TOKEN_GE 29
%token TOKEN_LE 30
%token TOKEN_EQ 31
%token TOKEN_NEQ 32
%token TOKEN_GT 33
%token TOKEN_LT 34
%token TOKEN_MOD 35
%token TOKEN_DIV 36
%token TOKEN_MUL 37
%token TOKEN_ADD 38
%token TOKEN_SUB 39
%token TOKEN_DECR 40
%token TOKEN_INCR 41
%token TOKEN_EXP 42
%token TOKEN_ASSIGNMENT 43
%token TOKEN_LPAREN 44
%token TOKEN_RPAREN 45
%token TOKEN_OPEN_CURLY_BRACE 46
%token TOKEN_CLOSE_CURLY_BRACE 47
%token TOKEN_OPEN_SQUARE_BRACE 48
%token TOKEN_CLOSE_SQUARE_BRACE 49
%token TOKEN_COMMA 50
%token TOKEN_TYPE_ASSIGNMENT 51
%token TOKEN_LOGICAL_AND 52
%token TOKEN_LOGICAL_OR 53
%token TOKEN_ERROR 54
%%

/* Here is the grammar: program is the start symbol. */

expr : TOKEN_ADD { parser_result = strdup(yytext);} 
;

%%

/* This function is called whenever the parser fails to parse the input */
int yyerror( char *s ) {
    printf("parse error: %s\n",s);
    printf("test ali. Coming from Bison\n",s);
    return 1;
}

