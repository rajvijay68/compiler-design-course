* Compiling lex programs
    - `lex program.l`
    - `gcc lex.yy.c`

* Compiling yacc programs
    - `yacc program.y`
        - This generates the `y.tab.c` file
        - To generate `y.tab.h` file also, use
            - `yacc -dy program.y`
    - `gcc y.tab.c`

* To generate the linked object file
    - `gcc lex.yy.c y.tab.c -lfl -ly`


* `undefined reference to 'yywrap'`
    - Solution - Compile with the `ll` flag
    - `gcc lex.yy.c -ll`

* To stop taking input from stdin - 
    - Press `Ctrl+D`

