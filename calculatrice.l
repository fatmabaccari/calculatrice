%{
#include "calculatrice.tab.h"
%}

entier   [0-9]
number   {entier}+({entier}+)?(E[-+]?{entier}+)?

%%
{number}    { yylval = atof(yytext); return number; }
"+"         { return plus; }
"-"         { return min; }
"*"         { return mul; }
"/"         { return div; }
"("         { return parouvrire; }
")"         { return parfermer; }
\n          { return '\n'; } // Retour à la ligne
[ \t]       ; // Ignorer les espaces et les tabulations
.           { fprintf(stderr, "Caractère non valide : %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}
