%{
#include <string.h>
#include "grammar.tab.h"
#include <stdio.h>
%}
%option noyywrap
%option yylineno 
%%
[//](.*)                        {return EOL;}
for|FOR							{return FOR;}//palabras reservadas del lenguaje
do|DO							{return DO;}
while|WHILE						{return WHILE;}
function|FUNCTION				{return FUNCTION;}
if|IF							{return IF;}
else|ELSE                       {return ELSE;}
break|BREAK						{return BREAK;}
in|IN							{return IN;}
printline|PRINTLINE             {return PRINT;}
[=]								{return EQUAL;}//declaracion de asignadores
[\:]							{return DATA_TYPE_LINK;}
[>][>]							{return RANGE;}
[=][+]							{return SAME_PLUS;}
[=][-]							{return SAME_MINUS;}
[+][+]							{return SAME_PLUS_ONE;}
[-][-]							{return SAME_MINUS_ONE;}

[-]								{return MINUS;}//declaracion de los operadores aritmeticos 
[+]								{return PLUS;}
[*]								{return PRODUCT;}
[%]								{return MODULE;}
[\/]							{return DIVISION;}
[\/][\^]							{return POW;}

[=][=]							{return COMPARATION;}//declaracion de los operadores logicos
[!][=]							{return NOT;}
[>]								{return HIGHER;}
[<]								{return LOWER;}
[>][=]							{return HIGHER_OR_EQUAL;}
[<][=]							{return LOWER_OR_EQUAL;}
[|]								{return OR;}
[&][&]							{return AND;}


[(]								{return OPEN_PARENTHESIS;}//declarando complementos
[)]								{return CLOSE_PARENTHESIS;}
[[]								{return OPEN_BRACKET;}
[]]								{return CLOSE_BRACKET;}
[{]								{return OPEN_CLASP;}
[}]								{return CLOSE_CLASP;}

BOOL|bool						{return BOOLEAN;}//declaracion de los tipos de datos
INT|int							{return INT;}
LNG|lng|long|LONG     			{return LONG;}
FLT|flt|float|FLOAT    			{return FLOAT;}
CHAR|char						{return CHAR;}
VAR|var     					{return VAR;}
CONST|const						{return CONST;}
[-][>]|return					{return RETURN;}
[\,]							{return SEPARATOR;}
STR|str|string|STRING       	{return STRING;}

[-]([0-9]{1,30})|([0-9]{1,30})	{return INT_VAL;}//declaracion de los valores
true|false						{return BOOLEAN_VAL;}
[-]([0-9]{1,60})|([0-9]{1,60})	{return LONG_VAL;}
[0-9]{1,30},[0-9]{1,30}			{return FLOAT_VAL;}
(["]|['])([A-Z]|[a-z]|[0-9]){1}(["]|['])	{return CHAR_VAL;}
(["]|['])(([a-z]|[A-Z]|[0-9]|[-!@?¿=)(&%$#.:;,_<> */{}+¡#¬|°·~½])){2,999}(["]|['])	{return STRING_VAL;}




([a-z]|[A-Z]|_){1,40}			{return NAME;}
\n								{return EOL;}
[ \t\n]							{/*Eliminar epacios en blanco*/}
.		                        {printf("Error lexico en la linea %d\n",yylineno);}
%%
int main(int argc,char *argv[]){
    if((yyin = fopen(argv[1],"rt"))== NULL){
        printf("\nNo se puede abrir el archivo: %s\n",argv[1]);
    }else{
        yyparse();
    }
    fclose(yyin); 
    printf("--------proceso finalizado---------\n");  
    return 0;    
}
