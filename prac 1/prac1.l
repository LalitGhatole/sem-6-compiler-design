%{
#include <stdio.h>
int yywrap(void); // Declaration
%}

%%

[a-b]*abb     { printf("Valid String: %s\n", yytext); }
.             { printf("Invalid String: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    return 0;
}
