%{ 
#include <stdio.h> 
#include <stdlib.h> 
#include "lex.yy.c" 
char st[100]; 
int top=0; 
%} 
  
%token    ID 
%left    '+' '-'
%left    '*' '/'
%left    UMINUS 
  
%% 
  
S  :  E   
E  :  E'+'{ push(); } T {pop();} 
   |  E'-'{ push();}  T {pop();} 
   |  T 
   ; 
T  :  T'*'{ push();}  F { pop();} 
   |  T'/'{ push();}  F { pop();} 
   |  F 
   ; 
F  :  '(' E{ pop();} ')'
   |  '-' { push();}  F{pop();} 
   |  ID  { print();} 
   ; 
  
%% 

void yyerror(char* msg){
	printf("%s",msg);
	return;
}  

  
int main() 
{ 
    printf("Enter infix expression:  ");  
    yyparse(); 
    printf("\n"); 
    return 0; 
} 
push() 
{ 
    st[top++]=yytext[0]; 
} 
  
pop() 
{ 
    printf("%c", st[--top]); 
} 
  
print() 
{ 
    printf("%c", yytext[0]); 
} 
