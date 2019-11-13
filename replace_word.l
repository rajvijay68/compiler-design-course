%{
#include<stdio.h>
#include<string.h>

char to_replace[] = "no";
char replace_with[] = "yes";
%}

%%
[a-zA-Z]+ {if(strcmp(yytext,to_replace)==0)
			fprintf(yyout,"%s",replace_with);
		   else
			fprintf(yyout,"%s",yytext);}

.|\n		fprintf(yyout,"%s",yytext);

%%

int yywrap(){
	return 1;
}

int main(void){
	char ipfile[100];
	char opfile[100];

	scanf("Enter input file name : %s",ipfile);
	scanf("Enter output file name : %s",opfile);

	yyin = fopen(ipfile,"r");
	yyout = fopen(opfile,"w");

	yylex();

	return 0;
}