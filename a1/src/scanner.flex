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
%%
[ \t\n\r]+ 

<INITIAL>{ 
"//" BEGIN(C_COMMENT_SINGLE); return TOKEN_COMMENT_BEGIN; 
}
<C_COMMENT_SINGLE>{
.* return TOKEN_COMMENT;
"\n" BEGIN(INITIAL); 
}

^(‘|'){LETTER}(’|')$      { return TOKEN_CHARACTER_LITERAL; } 

{DIGIT}+ { return TOKEN_DIGIT; }
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
^({LETTER}|_)({LETTER}|{DIGIT}){0,255} { return TOKEN_IDENTIFIER; }

.                                      { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }
