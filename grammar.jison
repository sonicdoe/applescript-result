%lex

%%

\s+ /* Skip whitespace. */

/lex

%%

Result
  : %empty
    { return null }
  ;
