%{
#include "../include/token.h"
#include "../include/helper.h"
%}

%option noinput
%option nounput
%option yylineno
%x C_COMMENT_SINGLE
%x C_COMMENT_MULTI


DIGIT  [0-9]
LETTER [a-zA-Z]
WHITESPACE [ \t\n\r]
IDENTIFIER ^({LETTER}|_)({LETTER}|{DIGIT}){0,255}

CHARACTER_LITERAL ^(‘|'){LETTER}(’|')$ 
INTEGER_LITERAL {DIGIT}+
BOOLEAN_LITERAL {true|false}
STRING_LITERAL ^"{LETTER}"$ 

INTEGER_TYPE integer
BOOLEAN_TYPE boolean
CHAR_TYPE char
STRING_TYPE string

INTEGER_LEFT_ASSIGNMENT_OPERAND {IDENTIFIER}:{WHITESPACE}*{INTEGER_TYPE}{WHITESPACE}*
INTEGER_RIGHT_ASSIGNMENT_OPERAND {WHITESPACE}*{INTEGER_LITERAL}{WHITESPACE}*

INTEGER_ASSIGNMENT {INTEGER_LEFT_ASSIGNMENT_OPERAND}{INTEGER_RIGHT_ASSIGNMENT_OPERAND}

ARRAY_SUBSCRIPT "[]"
FUNCTION_CALL "f()"

%%
[ \t\n\r]+ {}

<INITIAL>{ 
"//" BEGIN(C_COMMENT_SINGLE); 
}
<C_COMMENT_SINGLE>{
.* return TOKEN_COMMENT;
"\n" BEGIN(INITIAL); 
}
{CHARACTER_LITERAL} { return TOKEN_CHARACTER_LITERAL; } 
{INTEGER_ASSIGNMENT} { return TOKEN_INTEGER_DECLARATION; }
{ARRAY_SUBSCRIPT} { return TOKEN_ARRAY_SUBSCRIPT; }
{FUNCTION_CALL} { return TOKEN_FUNCTION_CALL; }

{INTEGER_LITERAL} { return TOKEN_DIGIT; }
array    { return TOKEN_ARRAY;    }
boolean  { return TOKEN_BOOLEAN;  }
char     { return TOKEN_CHAR;     }
else     { return TOKEN_ELSE;     }
false    { return TOKEN_FALSE;    }
for      { return TOKEN_FOR;      }
function { return TOKEN_FUNCTION; }
if       { return TOKEN_IF;       }
integer  { return TOKEN_INTEGER;  }
print    { return TOKEN_PRINT;    }
return   { return TOKEN_RETURN;   }
string   { return TOKEN_STRING;   }
true     { return TOKEN_TRUE;     }
void     { return TOKEN_VOID;     }
while    { return TOKEN_WHILE;    }
{IDENTIFIER} { return TOKEN_IDENTIFIER; }

.                                      { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }
