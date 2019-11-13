%{
#include<stdio.h>
#include<stdlib.h>
%}

%token A B NL

%%
S : E NL    {printf("Valid String\n");}
    ;
E : A E B | 
    ;
%%
int yyerror(char *msg){
    printf("Invalid string\n");
    exit(0);
}

main() 
{ 
  printf("enter the string\n"); 
  yyparse(); 
} 