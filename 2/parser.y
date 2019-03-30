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

%left OR
%left AND
%left NOT
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
