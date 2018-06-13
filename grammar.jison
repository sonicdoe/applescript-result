%lex

%%

\s+ /* Skip whitespace. */

"true" return 'TRUE'
"false" return 'FALSE'

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
