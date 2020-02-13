/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_GRAMMAR_TAB_H_INCLUDED
# define YY_YY_GRAMMAR_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    STRING = 259,
    BOOLEAN = 260,
    LONG = 261,
    FLOAT = 262,
    VAR = 263,
    CONST = 264,
    RETURN = 265,
    CHAR = 266,
    NAME = 267,
    SEPARATOR = 268,
    INT_VAL = 269,
    BOOLEAN_VAL = 270,
    LONG_VAL = 271,
    FLOAT_VAL = 272,
    STRING_VAL = 273,
    CHAR_VAL = 274,
    EQUAL = 275,
    SAME_PLUS = 276,
    SAME_MINUS = 277,
    SAME_PLUS_ONE = 278,
    SAME_MINUS_ONE = 279,
    DATA_TYPE_LINK = 280,
    MINUS = 281,
    PLUS = 282,
    PRODUCT = 283,
    MODULE = 284,
    DIVISION = 285,
    POW = 286,
    PRINT = 287,
    COMPARATION = 288,
    NOT = 289,
    HIGHER = 290,
    LOWER = 291,
    OR = 292,
    AND = 293,
    HIGHER_OR_EQUAL = 294,
    LOWER_OR_EQUAL = 295,
    OPEN_PARENTHESIS = 296,
    CLOSE_PARENTHESIS = 297,
    OPEN_BRACKET = 298,
    CLOSE_BRACKET = 299,
    OPEN_CLASP = 300,
    CLOSE_CLASP = 301,
    FOR = 302,
    DO = 303,
    WHILE = 304,
    FUNCTION = 305,
    BREAK = 306,
    IN = 307,
    RANGE = 308,
    IF = 309,
    ELSE = 310,
    EOL = 311
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GRAMMAR_TAB_H_INCLUDED  */
