%lex
%%

\s+                             /* skip */
[0-9]+                          return 'DIGIT'
[a-zA-Z][a-zA-Z0-9]+            return 'VAR'
"''"                            return 'EMPTYSINGLEQUOTE'
"\"\""                          return 'EMPTYDOUBLEQUOTE'
"'"(\\\\|\\\'|[^\\\'])+"'"      return 'STRSINGLE'
"\""(\\\\|\\\"|[^\\\"])+"\""    return 'STRDOUBLE'
"-"                             return '-'
"!="                            return '!='
"=="                            return '=='
">="                            return '>='
">"                             return '>'
"<="                            return '<='
"<"                             return '<'
"("                             return '('
")"                             return ')'
"&&"                            return '&&'
"||"                            return '||'
<<EOF>>                         return 'EOF'
.                               return 'INVALID'

/lex

%left '||' '&&'
%left '==' '!='
%left '<=' '<' '>=' '>'
%left UMINUS

%start expressions

%%

expressions
    : e EOF
        {
          typeof console !== 'undefined' ? console.log($1) : print($1); //js
          return $1;
        }
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
        {
         console.log(":RESULT:"+$e1+" "+" "+$e2); //js
         $$ = ( $e1 ) || ( $e2 );
        }
         /*$$ = ['(',$e1,')', '||', '(', $e2,')'];}*/
    | e '&&' e
        {
         console.log(":RESULT:"+$e1+" "+$e2); //js
         $$ = $e1 && $e2;
        }
    | '-' e %prec UMINUS
        {
         $$ = -$2;
        }
    | '(' e ')'
        {
         $$ = $e;
        }
    | DIGIT
        {
         $$ = Number(yytext); //js
         //php $$ = intval(yytext);
        }
    | VAR
        {
         console.log(":RESULT:VAR:"+Math.PI); /* TODO: FIXME */ //js
         $$ = Math.PI; //js
         //php $$ = M_PI;
        }
    | EMPTYDOUBLEQUOTE
        {
         console.log(':RESULT:empty string in double quotes:'+$EMPTYDOUBLEQUOTE); //js
         $$ = yytext;
        }
    | EMPTYSINGLEQUOTE
        {
         console.log(':RESULT:EMPTYSINGLEQUOTE:'+$EMPTYSINGLEQUOTE); //js
         $$ = '';
        }
    | STRSINGLE
        {
         console.log(':RESULT:STRSINGLE:'+$STRSINGLE); //js
         $$ = $STRSINGLE;
        }
    | STRDOUBLE
        {
         console.log(':RESULT:STRDOUBLE:'+$STRDOUBLE); //js
         $$ = $STRDOUBLE;
        }
    ;

//phpOption parserClass:ExprParser
//phpOption lexerClass:ExprLexer
