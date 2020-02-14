
%{
#include <stdlib.h> 
#include <stdio.h>
#define YYSTYPE char*
#define YYERROR_VERBOSE 1
%}

%token INT STRING BOOLEAN LONG FLOAT VAR CONST RETURN CHAR NAME SEPARATOR
%token INT_VAL BOOLEAN_VAL LONG_VAL FLOAT_VAL STRING_VAL CHAR_VAL
%token EQUAL SAME_PLUS SAME_MINUS SAME_PLUS_ONE SAME_MINUS_ONE DATA_TYPE_LINK
%token MINUS PLUS PRODUCT MODULE DIVISION POW PRINT
%token COMPARATION NOT HIGHER LOWER OR AND HIGHER_OR_EQUAL LOWER_OR_EQUAL 
%token OPEN_PARENTHESIS CLOSE_PARENTHESIS OPEN_BRACKET CLOSE_BRACKET OPEN_CLASP CLOSE_CLASP
%token FOR DO WHILE FUNCTION BREAK IN RANGE IF ELSE 
%token EOL
%expect-rr 1
%%

input: EOL 
     | declaration 
     | type_asignation
     | input declaration
     | input type_asignation
     | body_sintaxis
     | input body_sintaxis
     | for_sintaxis
     | input for_sintaxis
     | function_sintaxis
     | input function_sintaxis
     | error EOL		{ yyerrok;}
;

declaration: short_declaration
     | VAR short_declaration             
     | CONST short_declaration 
     | base_declaration 
     | VAR base_declaration             
     | CONST base_declaration 
     | array_declaration 
     | VAR array_declaration
     | CONST array_declaration         
;

type_asignation: 
    | data_type NAME             
;

number: INT_VAL
    | LONG_VAL
    | FLOAT_VAL
;

math_operation: PLUS
    | MINUS
    | PRODUCT
    | MODULE
    | DIVISION
    | POW
;

operation: number math_operation number
    | number math_operation NAME
    | NAME math_operation NAME
    | NAME math_operation data_value
;

default_asignation: EQUAL
;

base_asignation: default_asignation
    | SAME_PLUS
    | SAME_MINUS
;

base_declaration: INT NAME default_asignation INT_VAL
    | CHAR NAME default_asignation CHAR_VAL
    | STRING NAME default_asignation STRING_VAL
    | BOOLEAN NAME default_asignation BOOLEAN_VAL
    | LONG NAME default_asignation LONG_VAL
    | LONG NAME default_asignation INT_VAL
    | FLOAT NAME default_asignation FLOAT_VAL
    | FLOAT NAME default_asignation INT_VAL
;

short_declaration:NAME default_asignation data_value
    | NAME default_asignation NAME
;

array_parameter: OPEN_BRACKET INT_VAL CLOSE_BRACKET
;

array_declaration: NAME array_parameter default_asignation OPEN_BRACKET array_body CLOSE_BRACKET

;

array_bdy_item: OPEN_CLASP data_value CLOSE_CLASP    
;

array_body: 
    | array_bdy_item
    | array_body SEPARATOR array_body
;

base_re_asignation: NAME base_asignation NAME 
    |NAME base_asignation data_value
    | NAME base_asignation operation
;

base_condition: condition_option condition_operator condition_option         
;

condition_option: NAME
    |INT_VAL
    |STRING_VAL
    |LONG_VAL
    |FLOAT_VAL
    |BOOLEAN_VAL
    |CHAR_VAL
;
condition_operator: COMPARATION
    | NOT
    | HIGHER
    | LOWER
    | HIGHER_OR_EQUAL
    | LOWER_OR_EQUAL
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
print_sintaxis: PRINT OPEN_PARENTHESIS data_value CLOSE_PARENTHESIS 
    | PRINT OPEN_PARENTHESIS NAME CLOSE_PARENTHESIS 
;

body_sentence: EOL
    | declaration 
    | base_re_asignation 
    | for_sintaxis                     
    | while_sintaxis 
    | do_while_sintaxis 
    | if_sintaxis           
    | return_sentence 
    | BREAK 
    | print_sintaxis
    | value_more_one
;

value_more_one:NAME SAME_PLUS_ONE
    | NAME SAME_MINUS_ONE
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
data_value:INT_VAL                 
    | STRING_VAL               
    | BOOLEAN_VAL              
    | LONG_VAL                 
    | FLOAT_VAL                 
    | CHAR_VAL                 
    | data_type 
;

function_argument:
    | data_type DATA_TYPE_LINK NAME     
;

function_arg_body:function_argument
    | function_arg_body SEPARATOR function_arg_body 
;

for_sintaxis:FOR NAME IN INT_VAL RANGE INT_VAL OPEN_CLASP body_sintaxis CLOSE_CLASP                                        

;
while_sintaxis: WHILE OPEN_PARENTHESIS complex_condition CLOSE_PARENTHESIS OPEN_CLASP body_sintaxis CLOSE_CLASP          

;
do_while_sintaxis: DO OPEN_CLASP body_sintaxis CLOSE_CLASP WHILE OPEN_PARENTHESIS complex_condition CLOSE_PARENTHESIS    

;
else_sintaxis: ELSE OPEN_CLASP body_sintaxis CLOSE_CLASP 
    |   ELSE if_sintaxis 

;

if_sintaxis: IF OPEN_PARENTHESIS complex_condition CLOSE_PARENTHESIS OPEN_CLASP body_sintaxis CLOSE_CLASP
    |   if_sintaxis else_sintaxis 

;

function_sintaxis: FUNCTION NAME OPEN_PARENTHESIS  function_arg_body CLOSE_PARENTHESIS OPEN_CLASP body_sintaxis CLOSE_CLASP   
    |  FUNCTION NAME OPEN_PARENTHESIS  function_arg_body CLOSE_PARENTHESIS RETURN data_type OPEN_CLASP body_sintaxis CLOSE_CLASP  

;


return_sentence: RETURN NAME
    | RETURN data_value
;

%%

extern int yylineno;

yyerror(char *s){
    printf("Error '%s' en la linea '%d' \n", s,yylineno);
}

int yywrap(){
 return 1;
}
