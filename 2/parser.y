%baseclass-preinclude <iostream>

%lsp-needed

%token PROGRAM IDENTIFICATOR BEGIN END
%token NATURAL BOOL
%token TRUE FALSE
%token IF THEN ELSE ELSEIF ENDIF
%token WHILE DO DONE SKIP
%token READ WRITE
%token LEFT_BRACKET RIGHT_BRACKET
%token ASSIGN
%token SEMICOLON
%token NUMBER

%token NOT
%left AND OR
%left EQUALS
%left LESS_THAN GREATER_THAN
%left PLUS MINUS
%left STAR DIV MOD

%%

start: PROGRAM IDENTIFICATOR declarations BEGIN statements END
  {
    std::cout << "start -> PROGRAM IDENTIFICATOR declarations BEGIN statements END" << std::endl;
  }
;

declarations: // nothing
  {
    std::cout << "declarations -> nothing" << std::endl;
  }
| declaration declarations
  {
    std::cout << "declarations -> declaration declarations" << std::endl;
  }
;

declaration: type IDENTIFICATOR SEMICOLON
  {
    std::cout << "declaration -> type IDENTIFICATOR SEMICOLON" << std::endl;
  }
;

statements: statement
  {
    std::cout << "statements -> statement" << std::endl;
  }
| statement statements
  {
    std::cout << "statements -> statement statements" << std::endl;
  }
;

statement: SKIP SEMICOLON
// skip
  {
    std::cout << "statement -> SKIP" << std::endl;
  }
// assign
| IDENTIFICATOR ASSIGN expression SEMICOLON
  {
    std::cout << "statement -> IDENTIFICATOR ASSIGN expression SEMICOLON" << std::endl;
  }
// read
| READ LEFT_BRACKET IDENTIFICATOR RIGHT_BRACKET SEMICOLON
  {
    std::cout << "statement -> READ LEFT_BRACKET IDENTIFICATOR RIGHT_BRACKET SEMICOLON" << std::endl;
  }
// write
| WRITE LEFT_BRACKET IDENTIFICATOR RIGHT_BRACKET SEMICOLON
  {
    std::cout << "statement -> WRITE LEFT_BRACKET IDENTIFICATOR RIGHT_BRACKET SEMICOLON" << std::endl;
  }
// while
| WHILE expression DO statements DONE
  {
    std::cout << "statement -> WHILE expression DO statements DONE" << std::endl;
  }
// if , if else, if elseif..., if elseif... else
| ifelse
  {
    std::cout << "statement -> ifelse" << std::endl;
  }
;

ifelse: IF expression THEN statements elseifs ENDIF
  {
    std::cout << "ifelse -> IF expression THEN statements elseifs ENDIF" << std::endl;
  }
| IF expression THEN statements elseifs ELSE statements ENDIF
  {
    std::cout << "ifelse -> IF expression THEN statements elseifs ELSE statements ENDIF" << std::endl;
  }
;

elseifs: ELSEIF expression THEN statements elseifs
  {
    std::cout << "elseifs -> ELSEIF expression THEN statements elseifs" << std::endl;
  }
|
  {
    // no else if part
  }
;

type: NATURAL
  {
    std::cout << "type -> NATURAL" << std::endl;
  }
| BOOL
  {
    std::cout << "type -> BOOL" << std::endl;
  }
;

//%token NOT
//%left AND OR
//%left EQUALS
//%left LESS_THAN GREATER_THAN
//%left PLUS MINUS
//%left STAR DIV MOD

expression: NOT expression
  {
    std::cout << "expression -> NOT expression" << std::endl;
  }
| expression AND expression
  {
    std::cout << "expression -> expression AND expression" << std::endl;
  }
| expression OR expression
  {
    std::cout << "expression -> expression OR expression" << std::endl;
  }
| expression EQUALS expression
  {
    std::cout << "expression -> expression EQUALS expression" << std::endl;
  }
| expression LESS_THAN expression
  {
    std::cout << "expression -> expression LESS_THAN expression" << std::endl;
  }
| expression GREATER_THAN expression
  {
    std::cout << "expression -> expression GREATER_THAN expression" << std::endl;
  }
| expression PLUS expression
  {
    std::cout << "expression -> expression PLUS expression" << std::endl;
  }
| expression MINUS expression
  {
    std::cout << "expression -> expression MINUS expression" << std::endl;
  }
| expression STAR expression
  {
    std::cout << "expression -> expression STAR expression" << std::endl;
  }
| expression DIV expression
  {
    std::cout << "expression -> expression DIV expression" << std::endl;
  }
| expression MOD expression
  {
    std::cout << "expression -> expression MOD expression" << std::endl;
  }
// other ones
| TRUE
  {
    std::cout << "expression -> TRUE" << std::endl;
  }
| FALSE
  {
    std::cout << "expression -> FALSE" << std::endl;
  }
| NUMBER
  {
    std::cout << "expression -> NUMBER" << std::endl;
  }
| LEFT_BRACKET expression RIGHT_BRACKET
  {
    std::cout << "expression -> LEFT_BRACKET expression RIGHT_BRACKET" << std::endl;
  }
| IDENTIFICATOR
  {
    std::cout << "expression -> IDENTIFICATOR" << std::endl;
  }
;
