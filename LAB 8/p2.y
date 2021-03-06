%{
	#include<stdio.h>
	#include<ctype.h>
	int i=0;
	int yylex();
	void yyerror();
%}
%token NUM
%left '&' '|' 'x'
%right '!'
%%
S: E '\n' {printf("Result = %d\n",$$);return 0;}
E:E'&'E {$$=$1&$3;}
|E'|'E {$$=$1|$3;}
|'!'E {$$=!$2;}
|E'x'E {$$=($1&(!$3))|((!$1)&$3);}
|NUM {$$=$1;}
;
%%
void main()
{
	printf("\nEnter a Logical Expression: ");
	yyparse();
}
void yyerror()
{
	printf("Invalid Logical Expression\n");
}