%{
#include "globals.h"
%}
%option nounput yylineno

digit       [0-9]
number      {digit}+
letter      [a-zA-Z]
identifier  {letter}+
newline     \n
whitespace  [ \t]+
comment     "/*".*"*/"
%%
	/* reserved words */
if		    	{return IF;}			
else		    {return ELSE;}			
int		    	{return INT;}			
return	    	{return RETURN;}			
void		    {return VOID;}			
while		    {return WHILE;}

	/* special symbols */
\+		    {return PLUS;}
-		    {return MINUS;}
\*		    {return TIMES;}
\/		    {return OVER;}
\<		    {return LT;}
\<=			{return LTE;}
\>		    {return GT;}
\>=			{return GTE;}
=		    {return E;}
==			{return EE;}
!=			{return NE;}
;		    {return SEMICOLON;}
,		    {return COMMA;}
\(		    {return LPAREN;}
\)		    {return RPAREN;}
\[		    {return LBRACK;}
\]		    {return RBRACK;}
\{		    {return LCURL;}
\}		    {return RCURL;}


	/* multicharacter tokens */
{number}        {return NUM;}
{identifier}    {return ID;}

	/* whitespaces, newlines, tabs, and comments */
{newline}       {return NEWLINE;}
{whitespace}  	{return WHITESPACE;}
{comment}  		{return COMMENT;}

	/* handle unrecognized characters */
.		    {return ERROR;}
%%
int main(int argc, char *argv[]) 
{
	FILE *ifp = fopen(argv[1],"r");
	yyin = ifp;	
	yyout = fopen("scanner_out.txt", "w");
	
	FILE *ifp2 = fopen(argv[1],"r"); //for printing lines
	
	char *currLinebuffer;
    size_t bufsize = 250; //maximum 250 chars per line

    currLinebuffer = (char *)malloc(bufsize * sizeof(char));
    if( currLinebuffer == NULL)
    {
        perror("Unable to allocate buffer to read full lines");
        exit(1);
    }

    TokenType currentToken = yylex();
	getline(&currLinebuffer,&bufsize,ifp2);    
	fprintf(yyout, "LINE %d: %s\n", yylineno, currLinebuffer);
	while(currentToken){
        if (currentToken >= 1 && currentToken <= 25) {
			if (currentToken <= 6) fprintf(yyout, "%d: reserved word: %s\n", yylineno, reservedWords[currentToken - 1].str);
			else fprintf(yyout, "%d: special symbol: %s\n", yylineno, reservedWords[currentToken - 1].str);
		}
		else switch(currentToken) {
			case ID:
			case NUM:
				fprintf(yyout, "%d: %s, val=%s\n", yylineno, reservedWords[currentToken - 1].str, yytext);
				break;
			case ERROR:
				fprintf(yyout, "%d: ERROR: invalid character found: %s\n", yylineno, yytext);
				break;
			case NEWLINE:
				getline(&currLinebuffer,&bufsize,ifp2);    
				fprintf(yyout, "\nLINE %d: %s\n", yylineno, currLinebuffer);
				break;
			default: break;
		}
		currentToken = yylex();
    }
	printf("Done.\n");
	fclose(ifp);
	fclose(ifp2);
	fclose(yyout);
	return 0;
}