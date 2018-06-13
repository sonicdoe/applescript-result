%lex

%%

\s+ /* Skip whitespace. */

"true" return 'TRUE'
"false" return 'FALSE'

"-"?\d+"."\d+("E"[+-]\d+)? return 'REAL'
"-"?\d+ return 'INTEGER'

/lex

%%

Result
  : %empty
    { return null }
  | Boolean
    { return $1 }
  | Integer
    { return $1 }
  | Real
    { return $1 }
  ;

Boolean
  : TRUE
    { $$ = true }
  | FALSE
    { $$ = false }
  ;

Integer
  : INTEGER
    { $$ = parseInt(yytext) }
  ;

Real
  : REAL
    { $$ = parseFloat(yytext) }
  ;
