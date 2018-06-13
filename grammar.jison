%lex

%%

\s+ /* Skip whitespace. */

"true" return 'TRUE'
"false" return 'FALSE'

"-"?\d+"."\d+("E"[+-]\d+)? return 'REAL'
"-"?\d+ return 'INTEGER'

\"("\\"[\\"trn]|[^"])*\" yytext = yytext.slice(1, -1); return 'TEXT'

"{" return '{'
"}" return '}'
"," return ','

/lex

%%

Result
  : %empty
    { return null }
  | Value
    { return $1 }
  ;

Value
  : Boolean
  | Integer
  | Real
  | Text
  | List
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

List
  : '{' '}'
    { $$ = [] }
  | '{' Items '}'
    { $$ = $Items }
  ;

Items
  : Value
    { $$ = [$Value] }
  | Items ',' Value
    { $Items.push($Value); $$ = $Items }
  ;
