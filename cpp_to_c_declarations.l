%{ 
#include<stdio.h> 
#include<string.h> 
char decs[40][40],contents[10000] = "";
int count = 0,i = 0,j = 0;
char *ptr = NULL;
FILE *temp;
%} 

delim 			[ \t\n]
ws 				{delim}+
letter 			[a-zA-Z]
digit 			[0-9]
id 				{letter}({letter}|{digit})*
number 			[+-]?{digit}+(\.{digit}+)?(E[+-]?{digit}+)?
operator 		[\+\*\/\-]
term 			(({number}|{id}){operator})?({id}|{number})({operator}({number}|{id}))?
arithmetic 		({term}{operator})*{term}
datatype 		(int)|(float)
declaration 	{datatype}{ws}({id}\,{ws}?)*{id};{delim}?
assignment 		{id}({ws})?"="({ws})?{arithmetic}
definition 		{datatype}{ws}({assignment},{ws}?)*{assignment};(\n)?

%% 
{declaration} { 
	strcpy(decs[count++],yytext); 
	}
{definition} {
	ptr = strchr(yytext,' ');
	ptr++;
	strcat(contents,ptr);
	j = 0;
	while(yytext[j] != '=')
	{
		decs[count][j] = yytext[j];
		j++;
	}
	decs[count][j++] = ';';
	decs[count][j++] = '\n';
	decs[count++][j] = '\0';
}
. { 
	strcat(contents,yytext);
  }

%% 


int yywrap() 
{ 
	return 1; 
} 

int main() 
{ 
	char ipfile[100];
	char opfile[100];

	printf("Enter input file : ");
	scanf("%s",ipfile);
	printf("Enter output file: ");
	scanf("%s",opfile);
	yyin = fopen(ipfile,"r");
	yyout = fopen(opfile,"w");
	yylex();
	i = 0;
	while(contents[i-1] != '{')
	fprintf(yyout,"%c",contents[i++]); 
	fprintf(yyout,"\n");
	for(j = 0;j<count;j++)
	fprintf(yyout,"%s",decs[j]);
	ptr = strchr(contents,'{');
	ptr++;
	fprintf(yyout,"%s",ptr);
	
} 

