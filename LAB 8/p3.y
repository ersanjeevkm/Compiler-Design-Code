%{
	#include<stdio.h>
	void yyerror(char*);
	int yylex();
%}
%token FOR ID BOP UOP NUMBER
%%
prg: FOR '(' lexp ';' lexp ';' lexp ')' lbody {printf("Result: for-Loop syntax is correct\n\nEnter for-Expression:\n");}
;
lbody: stmt
| codeblock
;
codeblock:'{' stmt_list '}'
;
stmt_list: stmt_list stmt
|
;
stmt: lexp ';'
;
lexp: fexp
|
;
fexp: fexp ',' exp
|exp
|'(' fexp ')'
;
exp: ID BOP exp
| ID UOP
| UOP ID
| ID
| NUMBER
;
%%
void main()
{
	printf("\nEnter for-Expression:\n");
	yyparse();
}
void yyerror(char *s)
{
	printf("Result: Incorrect Syntax\n\n");
}