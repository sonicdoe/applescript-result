%lex

%%

\s+ /* Skip whitespace. */

"true" return 'TRUE'
"false" return 'FALSE'

/lex

%%

Result
  : %empty
    { return null }
  | Boolean
    { return $1 }
  ;

Boolean
  : TRUE
    { $$ = true }
  | FALSE
    { $$ = false }
  ;
