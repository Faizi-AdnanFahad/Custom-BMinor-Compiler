%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helper.h"

extern char *yytext;
extern int yylex();
int yyerror( char *str);
%}

%code requires {
  enum yytokentype {
     TOKEN_EOF = 0, // enum index start 0
     TOKEN_SEMICOLON, // enum index start 0
     TOKEN_DIGIT,
     TOKEN_CHARACTER_LITERAL,
     TOKEN_INTEGER_ASSINGMENT,
     TOKEN_BOOLEAN_ASSIGNMENT,
     TOKEN_CHARACTER_ASSIGNMENT,
     TOKEN_STRING_ASSIGNMENT,
     TOKEN_STRING_LITERAL,
     TOKEN_INTEGER_ARRAY,
     TOKEN_BOOLEAN_ARRAY,
     TOKEN_CHARACTER_ARRAY,
     TOKEN_STRING_ARRAY,
     TOKEN_ARRAY,
     TOKEN_BOOLEAN,
     TOKEN_CHAR,
     TOKEN_ELSE,
     TOKEN_FALSE,
     TOKEN_FOR,
     TOKEN_FUNCTION,
     TOKEN_IF,
     TOKEN_INTEGER,
     TOKEN_PRINT,
     TOKEN_RETURN,
     TOKEN_STRING,
     TOKEN_TRUE,
     TOKEN_VOID,
     TOKEN_WHILE,
     TOKEN_IDENTIFIER,
     TOKEN_GE, 
     TOKEN_LE, 
     TOKEN_EQ, 
     TOKEN_NEQ,
     TOKEN_GT,
     TOKEN_LT,
     TOKEN_MOD,
     TOKEN_DIV,
     TOKEN_MUL,
     TOKEN_ADD,
     TOKEN_SUB,
     TOKEN_DECR,
     TOKEN_INCR,
     TOKEN_EXP,
     TOKEN_ASSIGNMENT,
     TOKEN_OPEN_ROUND_BRACE,
     TOKEN_CLOSE_ROUND_BRACE,
     TOKEN_OPEN_CURLY_BRACE,
     TOKEN_CLOSE_CURLY_BRACE,
     TOKEN_OPEN_SQUARE_BRACE,
     TOKEN_CLOSE_SQUARE_BRACE,
     TOKEN_COMMA,
     TOKEN_TYPE_ASSIGNMENT,
     TOKEN_LOGICAL_AND,
     TOKEN_LOGICAL_OR,
     TOKEN_LOGICAL_OR,
     TOKEN_ERROR
  };
}

%token TOKEN_INTEGER_LITERAL 0
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_SEMI
%token TOKEN_EOF
%token TOKEN_SEMICOLON
%token TOKEN_DIGIT
%token TOKEN_CHARACTER_LITERAL
%token TOKEN_INTEGER_ASSINGMENT
%token TOKEN_BOOLEAN_ASSIGNMENT
%token TOKEN_CHARACTER_ASSIGNMENT
%token TOKEN_STRING_ASSIGNMENT
%token TOKEN_STRING_LITERAL
%token TOKEN_INTEGER_ARRAY
%token TOKEN_BOOLEAN_ARRAY
%token TOKEN_CHARACTER_ARRAY
%token TOKEN_STRING_ARRAY
%token TOKEN_ARRAY
%token TOKEN_BOOLEAN
%token TOKEN_CHAR
%token TOKEN_ELSE
%token TOKEN_FALSE
%token TOKEN_FOR
%token TOKEN_FUNCTION
%token TOKEN_IF
%token TOKEN_INTEGER
%token TOKEN_PRINT
%token TOKEN_RETURN
%token TOKEN_STRING
%token TOKEN_TRUE
%token TOKEN_VOID
%token TOKEN_WHILE
%token TOKEN_IDENTIFIER
%token TOKEN_GE
%token TOKEN_LE 
%token TOKEN_EQ
%token TOKEN_NEQ
%token TOKEN_GT
%token TOKEN_LT
%token TOKEN_MOD
%token TOKEN_DIV
%token TOKEN_MUL
%token TOKEN_ADD
%token TOKEN_SUB
%token TOKEN_DECR
%token TOKEN_INCR
%token TOKEN_EXP
%token TOKEN_ASSIGNMENT
%token TOKEN_OPEN_ROUND_BRACE
%token TOKEN_CLOSE_ROUND_BRACE
%token TOKEN_OPEN_CURLY_BRACE
%token TOKEN_CLOSE_CURLY_BRACE
%token TOKEN_OPEN_SQUARE_BRACE
%token TOKEN_CLOSE_SQUARE_BRACE
%token TOKEN_COMMA
%token TOKEN_TYPE_ASSIGNMENT
%token TOKEN_LOGICAL_AND
%token TOKEN_LOGICAL_OR
%token TOKEN_ERROR

%%

/* Here is the grammar: program is the start symbol. */

    program : expr TOKEN_SEMI
    ;

    expr : expr TOKEN_PLUS expr
    | expr TOKEN_MINUS term
    | term
    ;

    term : term TOKEN_MUL factor
    | term TOKEN_DIV factor
    | factor
    ;
    factor: TOKEN_MINUS factor
    | TOKEN_LPAREN expr TOKEN_RPAREN
    | TOKEN_INTEGER_LITERAL
    ;
%%

/* This function is called whenever the parser fails to parse the input */
int yyerror( char *s ) {
    printf("parse error: %s\n",s);
    printf("test ali. Coming from Bison\n",s);
    return 1;
}

