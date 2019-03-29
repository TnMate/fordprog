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

declaration:
  {
    std::cout << "declaration -> " << std::endl;
  }
;

statements:
  {
    std::cout << "statements -> " << std::endl;
  }
;

statement:
  {
    std::cout << "statement -> " << std::endl;
  }
;
