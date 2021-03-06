%{
	#include<stdio.h>
	int flag=0;
	int yylex();
	void yyerror();
%}
%token NUMBER LE GE EQ NE
%left '>' '<' LE GE EQ NE
%%
logicalExpression: E{ 
	if($$ == 1)
		printf("Expression is true\n");
	else
		printf("Expression is False\n");
	return 0;
};
E :E'>'E {$$=$1>$3;}
|E'<'E {$$=$1<$3;}
|E GE E {$$=$1>=$3;}
|E LE E {$$=$1<=$3;}
|E EQ E {$$=$1==$3;}
|E NE E {$$=$1!=$3;}
| NUMBER {$$=$1;}
;
%%
void main()
{
	printf("Enter an expression with relational operators\n");
	yyparse();
	if(flag==0)
		printf("Valid Expression\n");
}
void yyerror()
{
	printf("Invalid Expression\n");
	flag=1;
}