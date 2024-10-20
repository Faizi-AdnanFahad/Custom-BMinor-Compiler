/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_INCLUDE_TOKEN_H_INCLUDED
# define YY_YY_INCLUDE_TOKEN_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 12 "src/parser.bison" /* yacc.c:1909  */

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

#line 105 "include/token.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TOKEN_INTEGER_LITERAL = 0,
    TOKEN_PLUS = 258,
    TOKEN_MINUS = 259,
    TOKEN_LPAREN = 260,
    TOKEN_RPAREN = 261,
    TOKEN_SEMI = 262,
    TOKEN_EOF = 263,
    TOKEN_SEMICOLON = 264,
    TOKEN_DIGIT = 265,
    TOKEN_CHARACTER_LITERAL = 266,
    TOKEN_INTEGER_ASSINGMENT = 267,
    TOKEN_BOOLEAN_ASSIGNMENT = 268,
    TOKEN_CHARACTER_ASSIGNMENT = 269,
    TOKEN_STRING_ASSIGNMENT = 270,
    TOKEN_STRING_LITERAL = 271,
    TOKEN_INTEGER_ARRAY = 272,
    TOKEN_BOOLEAN_ARRAY = 273,
    TOKEN_CHARACTER_ARRAY = 274,
    TOKEN_STRING_ARRAY = 275,
    TOKEN_ARRAY = 276,
    TOKEN_BOOLEAN = 277,
    TOKEN_CHAR = 278,
    TOKEN_ELSE = 279,
    TOKEN_FALSE = 280,
    TOKEN_FOR = 281,
    TOKEN_FUNCTION = 282,
    TOKEN_IF = 283,
    TOKEN_INTEGER = 284,
    TOKEN_PRINT = 285,
    TOKEN_RETURN = 286,
    TOKEN_STRING = 287,
    TOKEN_TRUE = 288,
    TOKEN_VOID = 289,
    TOKEN_WHILE = 290,
    TOKEN_IDENTIFIER = 291,
    TOKEN_GE = 292,
    TOKEN_LE = 293,
    TOKEN_EQ = 294,
    TOKEN_NEQ = 295,
    TOKEN_GT = 296,
    TOKEN_LT = 297,
    TOKEN_MOD = 298,
    TOKEN_DIV = 299,
    TOKEN_MUL = 300,
    TOKEN_ADD = 301,
    TOKEN_SUB = 302,
    TOKEN_DECR = 303,
    TOKEN_INCR = 304,
    TOKEN_EXP = 305,
    TOKEN_ASSIGNMENT = 306,
    TOKEN_OPEN_ROUND_BRACE = 307,
    TOKEN_CLOSE_ROUND_BRACE = 308,
    TOKEN_OPEN_CURLY_BRACE = 309,
    TOKEN_CLOSE_CURLY_BRACE = 310,
    TOKEN_OPEN_SQUARE_BRACE = 311,
    TOKEN_CLOSE_SQUARE_BRACE = 312,
    TOKEN_COMMA = 313,
    TOKEN_TYPE_ASSIGNMENT = 314,
    TOKEN_LOGICAL_AND = 315,
    TOKEN_LOGICAL_OR = 316,
    TOKEN_ERROR = 317
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_INCLUDE_TOKEN_H_INCLUDED  */
