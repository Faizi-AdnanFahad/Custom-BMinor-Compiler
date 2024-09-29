// program exit code constant
int EXIT_CODE = 0;

// token.h token_t -> string map
const char* TOKEN_LOOKUP[] = {
     "TOKEN_EOF", // enum index start 0
     "TOKEN_SEMICOLON",
     "TOKEN_DIGIT",
     "TOKEN_CHARACTER_LITERAL",
     "TOKEN_INTEGER_ASSINGMENT",
     "TOKEN_BOOLEAN_ASSIGNMENT",
     "TOKEN_CHARACTER_ASSIGNMENT",
     "TOKEN_STRING_ASSIGNMENT",
     "TOKEN_STRING_LITERAL",
     "TOKEN_ARRAY",
     "TOKEN_BOOLEAN",
     "TOKEN_CHAR",
     "TOKEN_ELSE",
     "TOKEN_FALSE",
     "TOKEN_FOR",
     "TOKEN_FUNCTION",
     "TOKEN_IF",
     "TOKEN_INTEGER",
     "TOKEN_PRINT",
     "TOKEN_RETURN", 
     "TOKEN_STRING", 
     "TOKEN_TRUE",
     "TOKEN_VOID",
     "TOKEN_WHILE",
     "TOKEN_IDENTIFIER",
     "TOKEN_GE",
     "TOKEN_ERROR",
};

// ERROR MESSAGE CONSTANTS
const char* ERRORMSG_SCANNER_UNEXPECTED_CHAR = "scan error: Unexpected character '%c' at line %d";
