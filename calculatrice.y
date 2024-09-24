%{
#include <stdio.h>
#include <stdlib.h>
#include "calculatrice.tab.h"
%}

%token number
%left plus min
%left mul divi
%token parouvrire parfermer

%%

calc:
    | calc exp '\n' { printf("= %d\n", $2); }
    ;

exp:
    exp plus exp { $$ = $1 + $3; }
    | exp min exp { $$ = $1 - $3; }
    | exp mul exp { $$ = $1 * $3; }
    | exp divi exp { 
        if ($3 == 0) {
            fprintf(stderr, "Erreur: division par zéro\n");
            exit(1);
        }
        $$ = $1 / $3; 
    }
    | parouvrire exp parfermer { $$ = $2; }
    | number { $$ = $1; }
    ;

%%

int yyerror(const char *s) {
    fprintf(stderr, "Erreur syntaxique : %s\n", s);
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}


