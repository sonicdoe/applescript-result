%lex

%%

\s+ /* Skip whitespace. */

"true" return 'TRUE'
"false" return 'FALSE'

"-"?\d+"."\d+("E"[+-]\d+)? return 'REAL'
"-"?\d+ return 'INTEGER'

\"("\\"[\\"trn]|[^"])*\" yytext = yytext.slice(1, -1); return 'TEXT'

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
  | Text
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

Text
  : TEXT
    {
      $$ = yytext
        .replace(/\\\\/g, '\\')
        .replace(/\\"/g, '"')
        .replace(/\\t/g, '\t')
        .replace(/\\r/g, '\r')
        .replace(/\\n/g, '\n')
    }
  ;
