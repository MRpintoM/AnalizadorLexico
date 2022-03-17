package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
Del=[;]+
P=[.]+
Ag=[{,},(,)]+
%{
    public String lexeme;
%}
%%
int |
if |
else |
abstract|
assert|
boolean|
break|
byte|
case|
catch|
class|
const|
continue|
default|
do|
double|
enum|
extends|
false|
final|
finally|
float|
for|
goto|
implements|
import|
inner|
instanceof|
interface|
long|
native|
new|
null|
package|
private|
protected|
public|
return|
short|
static|
strinctfp|
super|
switch|
string|
synchronized|
this|
throw|
throws|
transient|
true|
try|
void|
volatile|
while {lexeme=yytext(); return Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"&" {lexeme=yytext(); return AND;}
"|" {lexeme=yytext(); return OR;}
"!" {lexeme=yytext(); return NOT;}
"^" {lexeme=yytext(); return XOR;}
"==" {lexeme=yytext(); return Comparacion;}
"!=" {lexeme=yytext(); return Distinto;}
"<" {lexeme=yytext(); return Menor;}
"<=" {lexeme=yytext(); return Me_Igual;}
">" {lexeme=yytext(); return Mayor;}
">=" {lexeme=yytext(); return Ma_Igual;}
{Del}* {lexeme=yytext(); return Delimitador;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
("(-"{D}+")")|{D}+{P}+{D}+ {lexeme=yytext(); return Numero;}
({Ag}+ {D}+ {Ag}|{Ag}+ {L}+ {Ag}+) + {lexeme=yytext(); return Agrupacion;}
 . {return ERROR;}

