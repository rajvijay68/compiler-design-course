%{ 
#include<stdio.h> 
#include<string.h> 
char initialization[100],condition[100],modification[100],S[200];
int count = 0;
%} 

statement [^;"for"\{\}]*

%% 
for\( { 
	// printf("Loop started: %s\n",yytext); 
	count++;
	}

{statement}; { 
	if(count == 1) 
	{strcpy(initialization,yytext); count++;} 
	else if(count == 2) 
	{strcpy(condition,yytext); count++; condition[strlen(condition)-1] = '\0'; }  
	}

{statement}\) { 
	strcpy(modification,yytext); 
	modification[strlen(modification)-1] = '\0';
	}

\{  { 
	// printf("Entering loop body...\n"); 
	}
 
({statement}|;)*\} {
	// printf("Ending loop body...\n"); 
	strcpy(S,yytext); 
	S[strlen(S)-1] = '\0';
	}

. printf("Syntax error in loop!\n");

%% 


int yywrap() 
{ 
	return 1; 
} 

int main() 
{ 
	extern FILE *yyin, *yyout; 
	char ipfile[100];
	char opfile[100];

	printf("Enter input file : ");
	scanf("%s",ipfile);
	printf("Enter output file: ");
	scanf("%s",opfile);
	yyin = fopen(ipfile,"r");
	yyout = fopen(opfile,"w");
	
	yylex(); 
	printf("Initialization: %s\n",initialization);
	printf("Condition: %s\n",condition);
	printf("Counter: %s\n",modification);
	printf("Body: %s\n",S);
	fprintf(yyout,"%s\nwhile(%s)\n{\n%s\n%s;\n}",initialization,condition,S,modification);
} 

