#ifndef TOKEN_H
#define TOKEN_H

typedef enum {
     TOKEN_EOF=0, // enum index start 0
     TOKEN_DIGIT, // enum index start 0
     TOKEN_CHARACTER_LITERAL,  
     TOKEN_COMMENT_BEGIN,  
     TOKEN_COMMENT_END,  
     TOKEN_COMMENT,  
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
     TOKEN_ERROR
} token_t;

// defined in constants.c, 1-1 mapping with token_t
extern const char* TOKEN_LOOKUP[];

#endif
