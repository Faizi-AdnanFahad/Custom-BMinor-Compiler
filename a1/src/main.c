#define _CRT_SECURE_NO_DEPRECATE
#include "../include/token.h"
#include "../include/messages.h"
#include "../include/constants.h"


int main(int argc, char *argv[]) {
    const char *option = argv[1];
    const char *filename = argv[2];

    if (argc < 3) {
        fprintf(stderr, "Usage: %s -scan sourcefile.bminor\n", argv[0]);
        exit(1);
    }

    if (strcmp(option, "-scan") == 0) run_scan(filename); 
    else {
        fprintf(stderr, "Unknown option: %s\n", option);
        exit(1);
    }

    return EXIT_CODE;
}

void run_scan(const char *filename) {
    // Open the file for reading
    yyin = fopen(filename, "r");
    
    // while not EOF
    int token = -1;
    while((token = yylex()) != TOKEN_EOF) {
      if(token == TOKEN_ERROR) {
        EXIT_CODE = 1;
        fprintf(stderr, ERRORMSG_SCANNER_UNEXPECTED_CHAR, yytext, yylineno);
      } else {
          if ( token == TOKEN_INTEGER || 
               token == TOKEN_STRING_LITERAL || 
               token == TOKEN_CHARACTER_LITERAL || 
               token == TOKEN_IDENTIFIER) {
           fprintf(stdout, "%s: %s\n", TOKEN_LOOKUP[token], yytext);
          } else {
           fprintf(stdout, "%s\n", TOKEN_LOOKUP[token]);
          }
        }
    }

    fclose(yyin);
    
    if(EXIT_CODE == 1) exit(1);
}
