/* calc.lex */
%{
#include "prac6.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[-+*/()]\n      { return *yytext; }
[ \t]           ; /* Skip whitespace */
.               { yyerror("Invalid character"); }
%%

int yywrap() {
    return 1;
}
