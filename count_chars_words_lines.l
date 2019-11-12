%{
int nchar,nword,nline;    
%}

%%

\n  {nline++;nchar++;}
[^  \t\n]+  {nword++, nchar+=yyleng;}
.   { nchar++;}

%%

int main(void){
    yylex();
    printf("Num of characters : %d\n",nchar);
    printf("Num of words : %d\n",nword);
    printf("Num of lines : %d\n",nline);
    return 0;
}
