%option noyywrap c++ yylineno

%{
#include <iostream>
#include <stdlib.h>
%}

DIGIT    		[0-9]
WS          	[ \t\n]
CHAR			[a-zA-Z]

%%

program		std::cout << "program" << std::endl;
begin		std::cout << "begin" << std::endl;
end			std::cout << "end" << std::endl;
natural		std::cout << "natural" << std::endl; 
boolean		std::cout << "boolean" << std::endl;
true     	std::cout << "true" << std::endl;
false     	std::cout << "false" << std::endl;
div     	std::cout << "div" << std::endl;
mod     	std::cout << "mod" << std::endl;
and     	std::cout << "and" << std::endl;
or     		std::cout << "or" << std::endl;
not     	std::cout << "not" << std::endl;
skip        std::cout << "skip" << std::endl;
if          std::cout << "if" << std::endl;
then        std::cout << "then" << std::endl;
else        std::cout << "else" << std::endl;
elseif      std::cout << "elseif" << std::endl;
endif       std::cout << "endif" << std::endl;
while       std::cout << "while" << std::endl;
do          std::cout << "do" << std::endl;
done        std::cout << "done" << std::endl;
read        std::cout << "read" << std::endl;
write       std::cout << "write" << std::endl;
"("         std::cout << "open" << std::endl;
")"         std::cout << "close" << std::endl;
":="      	std::cout << "dots" << std::endl;
"+"         std::cout << "plus" << std::endl;
"-"         std::cout << "minus" << std::endl;
"*"         std::cout << "star" << std::endl;
"<"         std::cout << "less" << std::endl;
">"         std::cout << "more" << std::endl;
"="         std::cout << "equal" << std::endl;
";"         std::cout << "semicolon" << std::endl;
"."         std::cout << "dot" << std::endl;

{DIGIT}+    std::cout << "number" << std::endl;

#[^#]*#		//std::cout<< "comment" << std::endl;

{CHAR}({CHAR}|{DIGIT}|_)*    std::cout << "identification: " << YYText() <<std::endl;

{WS}+   // feher szokozok: semmi teendo

. {
    std::cerr << lineno() << ". line: Lexical error!" << std::endl;
    exit(1);
}

%%
