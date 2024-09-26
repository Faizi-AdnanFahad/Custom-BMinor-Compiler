%{
#include "../include/token.h"
#include "../include/helper.h"
%}

%option nounput
%option noinput
%option yylineno

DIGIT  [0-9]
LETTER [a-zA-Z]
KEYWORDS [array|boolean|char|else|false|for|function|if|integer|print|return|string|true|void|while]
%%
(" "|\t|\n|\r) 
 \+        { return TOKEN_ADD;      }
 \-        { return TOKEN_SUBTRACT; }
array      { return TOKEN_ARRAY;    }      /* BEGIN RESERVED */
boolean    { return TOKEN_BOOLEAN;  }
char       { return TOKEN_CHAR;     }
else       { return TOKEN_ELSE;     }
false      { return TOKEN_FALSE;    }
for        { return TOKEN_FOR;      }
function   { return TOKEN_FUNCTION; }
if         { return TOKEN_IF;       }
integer    { return TOKEN_INTEGER;  }
print      { return TOKEN_PRINT;    }
return     { return TOKEN_RETURN;   }
string     { return TOKEN_STRING;   }
true       { return TOKEN_TRUE;     }
void       { return TOKEN_VOID;     }
while      { return TOKEN_WHILE;    }     /* END RESERVED */
({LETTER})   { return TOKEN_CHARACTER_LITERAL; }
{DIGIT}+     { return TOKEN_INTEGER_LITERAL; }
({LETTER}|{DIGIT}|_)+  { return TOKEN_IDENTIFIER; }
.          { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }
