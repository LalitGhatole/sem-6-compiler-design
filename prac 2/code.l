%{
#include <stdio.h>
int yywrap(void); // Declaration
%}

%%

[ \t\n]                  ; /* Ignore whitespace and newline */

[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); }

0[xX][0-9a-fA-F]+        { printf("Hexadecimal Constant: %s\n", yytext); }
0[0-7]+                  { printf("Octal Constant: %s\n", yytext); }
[1-9][0-9]*              { printf("Decimal Constant: %s\n", yytext); }

[0-9]+\.[0-9]+           { printf("Floating Point Constant: %s\n", yytext); }
[0-9]+[eE][-+]?[0-9]+    { printf("Exponential Constant: %s\n", yytext); }

.                        { printf("Invalid Token: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    return 0;
}
