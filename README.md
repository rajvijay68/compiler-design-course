# Compiler Design programs

Tools used : 
-   tokenizer -  lex (flex 2.6.4) 
-   parser - yacc (bison (GNU Bison) 3.0.4) - 
-   Usually come pre-installed in linux.
-   If not, install with
    -   `sudo apt install flex`
    -   `sudo apt install bison`

Programs 
-   [Simply print stdin to stdout](nothing.l)
-  [Prepend line number](line_num.l)
-   [Count identifiers](count_identifiers.l)
-   [Count characters,words,lines](count_chars_words_lines.l)
-   [Replace one character with another](replace_character.l)
-   Calculator
    -   [lex](calculator.l)
    -   [yacc](calculator.y)
-   Infix to Postfix - 
    -   [lex](infix_to_postfix.l)
    -   [yacc](infix_to_postfix.y)
-   a<sup>n</sup>b<sup>n</sup>
    -   [lex](anbn.l)
    -   [yacc](anbn.y)
- [C macros to function](macros_to_function.l)
