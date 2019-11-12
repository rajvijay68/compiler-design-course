    /*
    Lex program to replace every occurence of 'i'
    with 'e'
    */
%%
[i]     {printf("e");}
.|\n    {printf("%s",yytext);}

%%
int main(){
    yylex();
    return 0;
}