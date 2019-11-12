%{
    int yyline_num = 0;
%}
%%
^(.*)\n     {printf("%4d\t%s",++yyline_num,yytext);}
%%
int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    fclose(yyin);
}