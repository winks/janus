%lex
%%

\s+                     /* skip */
[0-9]+                  return 'DIGIT'
[a-zA-Z][a-zA-Z0-9]+    return 'VAR'
"\"\""                  return 'STRDOUBLE'
"'"([^\\])+"'"          return 'STRSINGLE'
"-"         return '-'
"!="        return '!='
"=="        return '=='
">="        return '>='
">"         return '>'
"<="        return '<='
"<"         return '<'
"("         return '('
")"         return ')'
"&&"        return '&&'
"||"        return '||'
<<EOF>>     return 'EOF'
.           return 'INVALID'

/lex

%left '<=' '<' '>=' '>'
%left '==' '!='
%left '||' '&&'
%left UMINUS
/*
%nonassoc '(' ')'
*/

%start expressions

%%

expressions
    : e EOF
        { typeof console !== 'undefined' ? console.log($1) : print($1);
          return $1; }
    ;

e
    : e '!=' e
        {$$ = $1 != $3;}
    | e '==' e
        {$$ = $1 == $3;}
    | e '>=' e
        {$$ = $1 >= $3;}
    | e '>' e
        {$$ = $1 > $3;}
    | e '<=' e
        {$$ = $1 <= $3;}
    | e '<' e
        {$$ = $1 < $3;}
    | e '||' e
        {console.log($e1+" "+" "+$e2); $$ = ['(',$e1,')', '||', '(', $e2,')'];}
    | e '&&' e
        {console.log($e1+" "+$e2); $$ = $e1 && $e2;}
    | '-' e %prec UMINUS
        {$$ = -$2;}
    | '(' e ')'
        {$$ = $e;}
    | DIGIT
        {$$ = Number(yytext);}
    | VAR
        {console.log(Math.PI); $$ = Math.PI;}
    | STRDOUBLE
        {console.log('"_'+$STRDOUBLE); $$ = $STRDOUBLE;}
    | STRSINGLE
        {console.log('\'_'+$STRSINGLE); $$ = $STRSINGLE;}
    ;
