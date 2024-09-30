#ifndef TOKEN_H
#define TOKEN_H

void run_scan(const char *filename);

typedef enum
{
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
     TOKEN_ERROR
} token_t;

// defined in constants.c, 1-1 mapping with token_t
extern const char* TOKEN_LOOKUP[];

#endif
