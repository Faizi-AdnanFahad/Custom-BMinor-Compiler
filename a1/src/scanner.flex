%{
#include "../include/token.h"
#include "../include/helper.h"
%}

%option noinput
%option nounput
%option yylineno
%x C_COMMENT
%x CPP_COMMENT

DIGIT  [0-9]
LETTER [A-z]
WHITESPACE [ \t\n\r]
ESCAPE [\a\b\e\f\n\r\t\v\\\'\"\?]
IDENTIFIER ([A-z]|_)({LETTER}|{DIGIT}|_)*

INTEGER_LITERAL {DIGIT}+
BOOLEAN_LITERAL (true|false)
CHARACTER_LITERAL ("‘"|"'")[\x00-\xFF]("’"|"'")
STRING_LITERAL \"({LETTER}|{WHITESPACE}|\\n)*\"

INTEGER_TYPE integer
BOOLEAN_TYPE boolean
CHARACTER_TYPE char
STRING_TYPE string
ARRAY_TYPE array
        
/* Specific assignment macros per atomic type (integers, booleans, characters, and strings) */
INTEGER_ASSIGNMENT  ={WHITESPACE}*{INTEGER_LITERAL}
BOOLEAN_ASSIGNMENT ={WHITESPACE}*{BOOLEAN_LITERAL}
CHARACTER_ASSIGNMENT ={WHITESPACE}*{CHARACTER_LITERAL}
STRING_ASSIGNMENT ={WHITESPACE}*{STRING_LITERAL}

/* Specific assignment macros per atomic type for arrays */
Array_INT_ASSIGNMENT ={WHITESPACE}*\{{WHITESPACE}*({DIGIT}+({WHITESPACE}*,{WHITESPACE}*{DIGIT}+)*)?{WHITESPACE}*\}
ARRAY_BOOLEAN_ASSIGNMENT ={WHITESPACE}*\{{WHITESPACE}*({BOOLEAN_LITERAL}({WHITESPACE}*,{WHITESPACE}*{BOOLEAN_LITERAL})*)?{WHITESPACE}*\}

%%
{WHITESPACE} {}
<INITIAL>{
  "//" BEGIN(C_COMMENT);
  "/*" BEGIN(CPP_COMMENT);
}
<C_COMMENT>{
  "\n" BEGIN(INITIAL);
  [^\n]+ // eat comment
}
<CPP_COMMENT>{
  [^\*]+ // eat comment
  "*"  
  "*/" BEGIN(INITIAL);
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
; { return TOKEN_SEMICOLON; }


">=" { return TOKEN_GE; }

{INTEGER_LITERAL} { return TOKEN_DIGIT; }
{CHARACTER_LITERAL} { return TOKEN_CHARACTER_LITERAL; }
{STRING_LITERAL} { return TOKEN_STRING_LITERAL; }

{IDENTIFIER} { return TOKEN_IDENTIFIER; }

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{INTEGER_TYPE}{WHITESPACE}*({INTEGER_ASSIGNMENT})?{WHITESPACE}*; {
    return TOKEN_INTEGER_ASSINGMENT;
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{BOOLEAN_TYPE}{WHITESPACE}*({BOOLEAN_ASSIGNMENT})?{WHITESPACE}*; {
    return TOKEN_BOOLEAN_ASSIGNMENT;
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{CHARACTER_TYPE}{WHITESPACE}*({CHARACTER_ASSIGNMENT})?{WHITESPACE}*; {
    return TOKEN_CHARACTER_ASSIGNMENT;
}

{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{STRING_TYPE}{WHITESPACE}*({STRING_ASSIGNMENT})?{WHITESPACE}*; {
    return TOKEN_STRING_ASSIGNMENT;
}


{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{ARRAY_TYPE}{WHITESPACE}*\[{INTEGER_LITERAL}\]{WHITESPACE}*{INTEGER_TYPE}{WHITESPACE}*({Array_INT_ASSIGNMENT})?{WHITESPACE}*; {
  return TOKEN_INTEGER_ARRAY;
}
{IDENTIFIER}{WHITESPACE}*:{WHITESPACE}*{ARRAY_TYPE}{WHITESPACE}*\[{INTEGER_LITERAL}\]{WHITESPACE}*{BOOLEAN_TYPE}{WHITESPACE}*({ARRAY_BOOLEAN_ASSIGNMENT})?{WHITESPACE}*; {
  return TOKEN_BOOLEAN_ARRAY;
}

.                                      { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }

