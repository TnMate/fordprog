%baseclass-preinclude <iostream>

%lsp-needed

%token PROGRAM IDENTIFICATOR BEGIN END

%%

start: PROGRAM IDENTIFICATOR declarations BEGIN body END
  {
    std::cout << " -> " << std__endl
  }
;
