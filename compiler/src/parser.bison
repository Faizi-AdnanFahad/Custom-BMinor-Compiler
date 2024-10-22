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

     // The program can either be a series of declarations or an expression followed by a semicolon.
     program : declaration_list
          | expr TOKEN_SEMICOLON
          ;

     // Declaration List
     declaration_list : declaration_list declaration
                    | /* empty */
                    ;

     // Declarations (Variable, Function, and Type)
     declaration : var_declaration
               | function_declaration
               | type_declaration
               ;

     // Variable Declarations without an assignment
     var_declaration : TOKEN_IDENTIFIER TOKEN_TYPE_ASSIGNMENT type_specifier TOKEN_SEMICOLON
                    | TOKEN_IDENTIFIER TOKEN_TYPE_ASSIGNMENT TOKEN_ARRAY TOKEN_OPEN_SQUARE_BRACE TOKEN_DIGIT TOKEN_CLOSE_SQUARE_BRACE type_specifier TOKEN_SEMICOLON // a: array[4] integer;
                    | var_declaration_array_with_assign
                    | var_declaration_with_assign
                    ;

     var_declaration_array_with_assign : TOKEN_IDENTIFIER TOKEN_TYPE_ASSIGNMENT TOKEN_ARRAY TOKEN_OPEN_SQUARE_BRACE TOKEN_DIGIT TOKEN_CLOSE_SQUARE_BRACE type_specifier TOKEN_ASSIGNMENT TOKEN_OPEN_CURLY_BRACE expr_list TOKEN_CLOSE_CURLY_BRACE TOKEN_SEMICOLON

     expr_list : expr
               | expr_list TOKEN_COMMA expr
               ;

     // Variable Declarations with an assignment
     var_declaration_with_assign : TOKEN_IDENTIFIER TOKEN_TYPE_ASSIGNMENT type_specifier TOKEN_ASSIGNMENT expr TOKEN_SEMICOLON
                              ;

     // Type Specifiers (int, bool, char, string)
     type_specifier : TOKEN_INTEGER_LITERAL
                    | TOKEN_BOOLEAN
                    | TOKEN_CHAR
                    | TOKEN_STRING
                    ;

     // Function Declarations
     function_declaration : type_specifier TOKEN_IDENTIFIER TOKEN_LPAREN param_list TOKEN_RPAREN compound_stmt
                         ;

     // Parameter List for Functions
     param_list : param_list TOKEN_COMMA param
               | param
               | /* empty */
               ;

     // Parameters
     param : type_specifier TOKEN_IDENTIFIER
          ;

     // Compound Statement (For function bodies or block scopes)
     compound_stmt : TOKEN_OPEN_CURLY_BRACE local_declarations stmt_list TOKEN_CLOSE_CURLY_BRACE
               ;

     // Local Declarations within compound statements
     local_declarations : local_declarations var_declaration
                    | /* empty */
                    ;

     // List of statements within a block
     stmt_list : stmt_list stmt
               | /* empty */
               ;

     // Statements can be expression statements, compound statements, or return statements.
     stmt : expr_stmt
          | compound_stmt
          | return_stmt
          ;

     // Expression Statements (an expression followed by a semicolon)
     expr_stmt : expr TOKEN_SEMICOLON
               | TOKEN_SEMICOLON
               ;

     // Return Statements (used in function return)
     return_stmt : TOKEN_RETURN expr TOKEN_SEMICOLON
               ;

     // Type Declarations (optional, depending on Bminor's requirements)
     type_declaration : /* Add specific rules for type declarations if required */
                    ;

     // Expression Grammar
     expr : expr TOKEN_ADD term
          | expr TOKEN_SUB term
          | term
          ;

     // Term Grammar (multiplication and division)
     term : term TOKEN_MUL factor
          | term TOKEN_DIV factor
          | term TOKEN_GT factor
          | term TOKEN_LT factor
          | term TOKEN_GE factor
          | term TOKEN_LE factor
          | term TOKEN_NEQ factor
          | term TOKEN_EQ factor
          | term TOKEN_LOGICAL_AND factor
          | term TOKEN_LOGICAL_OR factor
          | factor
          ;

     // Factor Grammar (negation, parentheses, and digit handling)
     factor : TOKEN_SUB factor
          | TOKEN_LPAREN expr TOKEN_RPAREN
          | TOKEN_DIGIT
          | TOKEN_TRUE
          | TOKEN_FALSE
          | TOKEN_STRING_LITERAL
          | TOKEN_CHARACTER_LITERAL
          ;
%%

/* This function is called whenever the parser fails to parse the input */
int yyerror( char *s ) {
    printf("parser.bison: parse error: %s\n",s);
    return 1;
}

