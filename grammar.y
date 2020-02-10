
%{
#include <stdlib.h> 
#include <stdio.h>
#define YYSTYPE char*
%}

%token INT STRING BOOLEAN LONG FLOAT VAR CONST RETURN CHAR NAME SEPARATOR
%token INT_VAL BOOLEAN_VAL LONG_VAL FLOAT_VAL STRING_VAL CHAR_VAL
%token EQUAL SAME_PLUS SAME_MINUS SAME_PLUS_ONE SAME_MINUS_ONE DATA_TYPE_LINK
%token MINUS PLUS PRODUCT MODULE DIVISION POW PRINT
%token COMPARATION NOT HIGHER LOWER OR AND HIGHER_OR_EQUAL LOWER_OR_EQUAL 
%token OPEN_PARENTHESIS CLOSE_PARENTHESIS OPEN_BRACKET CLOSE_BRACKET OPEN_CLASP CLOSE_CLASP
%token FOR DO WHILE FUNCTION BREAK IN RANGE IF ELSE
%token EOL
%%

input: declaration 
     | type_asignation
     | base_condition
     | complex_condition
     | input declaration
     | input type_asignation
     | input base_condition
     | input complex_condition
     | body_sentence
     | input body_sentence
     | for_sintaxis
     | input for_sintaxis
     | function_sintaxis
     | input function_sintaxis
     | operation
     | RANGE                        {printf("<< range");}
;

declaration: VAR base_declaration             {printf(">> Declaración Correcta!! \n"); printf("> ");}
     | CONST base_declaration           {printf(">> Declaración Correcta!! \n"); printf("> ");}
;

type_asignation: 
    | data_type NAME             
;

type_number: INT_VAL
    | LONG_VAL
    | FLOAT_VAL
    | NAME
;

operation: type_number MINUS type_number
    | type_number PLUS type_number {printf(">> Declaración Correcta!! \n"); printf("> ");}
    | type_number PRODUCT type_number
    | type_number MODULE type_number 
    | type_number DIVISION type_number
    | type_number POW type_number
;

base_asignation: EQUAL
    | SAME_PLUS
    | SAME_MINUS
;

base_declaration: INT NAME base_asignation INT_VAL
    | CHAR NAME base_asignation CHAR_VAL
    | STRING NAME base_asignation STRING_VAL
    | BOOLEAN NAME base_asignation BOOLEAN_VAL
    | LONG NAME base_asignation LONG_VAL
    | LONG NAME base_asignation INT_VAL
    | FLOAT NAME base_asignation FLOAT_VAL
    | FLOAT NAME base_asignation INT_VAL
    | INT NAME base_asignation operation
    | LONG NAME base_asignation operation
    | FLOAT NAME base_asignation operation
;

base_re_asignation: NAME base_asignation data_value
;

base_condition: condition_option COMPARATION condition_option         
    | condition_option NOT condition_option                 
    | condition_option HIGHER condition_option              
    | condition_option LOWER condition_option               
    | condition_option HIGHER_OR_EQUAL condition_option     
    | condition_option LOWER_OR_EQUAL condition_option      
;

condition_option: EOL
    |NAME
    |INT_VAL
    |STRING_VAL
    |LONG_VAL
    |FLOAT_VAL
    |BOOLEAN_VAL
    |BOOLEAN
    |CHAR_VAL
;

complex_condition: base_condition
    | base_condition AND base_condition                                 
    | base_condition OR base_condition                                  
    | complex_condition AND complex_condition                           
    | complex_condition OR complex_condition                            
;

body_sintaxis: 
    | EOL
    | body_sentence
    | body_sintaxis body_sentence
;
print_sintaxis: PRINT OPEN_PARENTHESIS data_value CLOSE_PARENTHESIS EOL
;

body_sentence: 
    | EOL 
    | declaration 
    | base_declaration 
    | base_re_asignation 
    | for_sintaxis                     
    | while_sintaxis 
    | do_while_sintaxis 
    | if_sintaxis           
    | return_sentence 
    | BREAK 
    | print_sintaxis
    | error EOL		{ yyerrok;}
;
data_type:  
    | INT                  
    | STRING                
    | BOOLEAN               
    | LONG                  
    | FLOAT                 
    | CHAR                 
    | data_type EOL
;
data_value:  
    | INT_VAL                 
    | STRING_VAL               
    | BOOLEAN_VAL              
    | LONG_VAL                 
    | FLOAT_VAL                 
    | CHAR_VAL                 
    | data_type EOL
;

function_argument:
    | data_type DATA_TYPE_LINK NAME     
;

function_arg_body:
    | function_argument
    | function_arg_body SEPARATOR function_arg_body 
;

for_sintaxis:FOR NAME IN INT_VAL RANGE INT_VAL OPEN_CLASP body_sintaxis CLOSE_CLASP                                         {printf(">> for correcto !! \n"); printf("> ");}
;
while_sintaxis: WHILE OPEN_PARENTHESIS complex_condition CLOSE_PARENTHESIS OPEN_CLASP body_sintaxis CLOSE_CLASP EOL         {printf(">> while correcto !! \n"); printf("> ");}
;
do_while_sintaxis: DO OPEN_CLASP body_sintaxis CLOSE_CLASP WHILE OPEN_PARENTHESIS complex_condition CLOSE_PARENTHESIS EOL   {printf(">> do while correcto !! \n"); printf("> ");}
;
else_sintaxis: ELSE OPEN_CLASP body_sintaxis CLOSE_CLASP
    |   ELSE if_sintaxis
;

if_sintaxis: IF OPEN_PARENTHESIS complex_condition CLOSE_PARENTHESIS OPEN_CLASP body_sintaxis CLOSE_CLASP
    |   if_sintaxis else_sintaxis
;

function_sintaxis: FUNCTION NAME OPEN_PARENTHESIS  function_arg_body CLOSE_PARENTHESIS OPEN_CLASP body_sintaxis CLOSE_CLASP   {printf(">> function OK!! \n"); printf("> ");}
    |  FUNCTION NAME OPEN_PARENTHESIS  function_arg_body CLOSE_PARENTHESIS RETURN data_type OPEN_CLASP body_sintaxis CLOSE_CLASP  {printf(">> function extended OK!! \n"); printf("> ");}
    |  function_sintaxis EOL
;


return_sentence: RETURN NAME
    | RETURN STRING_VAL
    | RETURN INT_VAL
    | RETURN LONG_VAL 
    | RETURN CHAR_VAL
;


%%

yyerror(char *s){
 fprintf(stderr, "Error: %s\n", s);
}

int yywrap(){
 return 1;
}
