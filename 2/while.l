%option noyywrap c++ yylineno

%{
#include <iostream>
#include "Parserbase.h"
%}

DIGIT    		[0-9]
CHAR			  [a-zA-Z]
WS          [ \t\n]

%%

program		  return Parser::PROGRAM;
begin		    return Parser::BEGIN;
end			    return Parser::END;
natural		  return Parser::NATURAL;
boolean		  return Parser::BOOL;
true     	  return Parser::TRUE;
false     	return Parser::FALSE;
div       	return Parser::DIV;
mod     	  return Parser::MOD;
and     	  return Parser::AND;
or     		  return Parser::OR;
not     	  return Parser::NOT;
skip        return Parser::SKIP;
if          return Parser::IF;
then        return Parser::THEN;
else        return Parser::ELSE;
elseif      return Parser::ELSEIF;
endif       return Parser::ENDIF;
while       return Parser::WHILE;
do          return Parser::DO;
done        return Parser::DONE;
read        return Parser::READ;
write       return Parser::WRITE;

"("         return Parser::LEFT_BRACKET;
")"         return Parser::RIGHT_BRACKET;
":="      	return Parser::ASSIGN;
"+"         return Parser::PLUS;
"-"         return Parser::MINUS;
"*"         return Parser::STAR;
"<"         return Parser::LESS_THAN;
">"         return Parser::GREATER_THAN;
"="         return Parser::EQUALS;
";"         return Parser::SEMICOLON;

{CHAR}({CHAR}|{DIGIT}|_)*    return Parser::IDENTIFICATOR;
{DIGIT}+    return Parser::NUMBER;

#[^#]*#		  // komment: semmi teendo
{WS}+       // feher szokozok: semmi teendo



. {
    std::cerr << lineno() << ". line: Lexical error!" << std::endl;
    exit(1);
}

%%
