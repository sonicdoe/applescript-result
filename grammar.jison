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

\w+ return 'LABEL'
":" return ':'

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
  | Record
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

Record
  : '{' Properties '}'
    { $$ = $Properties }
  ;

Properties
  : Property
    { $$ = { [$Property.label]: $Property.value } }
  | Properties ',' Property
    { $Properties[$Property.label] = $Property.value; $$ = $Properties }
  ;

Property
  : LABEL ':' Value
    { $$ = { label: $LABEL, value: $Value } }
  ;
