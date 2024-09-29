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
IDENTIFIER ^({LETTER}|_)({LETTER}|{DIGIT}|_){0,255}

INTEGER_LITERAL {DIGIT}+
BOOLEAN_LITERAL (true|false)
CHARACTER_LITERAL ^(‘|'|’)({LETTER}|{DIGIT})(‘|'|’)$
STRING_LITERAL ^\"({LETTER}|{WHITESPACE}|\\n)*\"$

INTEGER_TYPE integer
BOOLEAN_TYPE boolean
CHARACTER_TYPE char
STRING_TYPE string
        
/* Specific assignment macros per atomic type (integers, booleans, characters, and strings) */
INTEGER_ASSIGNMENT  ={WHITESPACE}*{INTEGER_LITERAL}
BOOLEAN_ASSIGNMENT ={WHITESPACE}*{BOOLEAN_LITERAL}
STRING_ASSIGNMENT ={WHITESPACE}*{STRING_LITERAL}

%%

[ \t\n\r]+ {}
{INTEGER_LITERAL} { return TOKEN_DIGIT; }
{CHARACTER_LITERAL} { return TOKEN_CHARACTER_LITERAL; }
{STRING_LITERAL}  { return TOKEN_STRING_LITERAL; }

<INITIAL>{ 
"//" BEGIN(C_COMMENT_SINGLE); 
}
<C_COMMENT_SINGLE>{
.* return TOKEN_COMMENT;
"\n" BEGIN(INITIAL); 
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{INTEGER_TYPE}{WHITESPACE}*({INTEGER_ASSIGNMENT})?{WHITESPACE}*; {
    return TOKEN_INTEGER_ASSINGMENT;
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{BOOLEAN_TYPE}{WHITESPACE}*({BOOLEAN_ASSIGNMENT})?{WHITESPACE}*; {
    return TOKEN_BOOLEAN_ASSIGNMENT;
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{CHARACTER_TYPE}{WHITESPACE}*(={WHITESPACE}*CHARACTER_LITERAL)?{WHITESPACE}*; {
    return TOKEN_CHARACTER_ASSIGNMENT;
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{STRING_TYPE}{WHITESPACE}*(={WHITESPACE}*(^\"({LETTER}|{WHITESPACE}|\\n)*\"$))?{WHITESPACE}*; {
    return TOKEN_STRING_ASSIGNMENT;
}

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
