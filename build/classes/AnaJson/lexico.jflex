package AnaJson; 
import java_cup.runtime.*;
import java.util.ArrayList;
import Errores.Excepcion;
import Tokens.token;

%%	
//-------> Directivas (No tocar)

%public 
%class Lex
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 

        // crear un arraylist para los errores lexicos
        public  ArrayList<Excepcion> erroresLexicos = new ArrayList<Excepcion>() ;
        // array tokens
        public  ArrayList<token> Rtokens = new ArrayList<token>() ;
%}  

//expresion regular
COMENTARIO = [//][^"\n"]+
COMENTARIOLINEAS = [/][*][^\!\>]*[*][/]
CADENA = ([\"][^\n\"]+[\"])|([\'][^\n\']+[\']) 
ID = [a-zA-Z][a-zA-Z0-9_]* 
NUMEROS = ([0-9]+)(\.[0-9]+)?

%%
<YYINITIAL> ("NombreJson")   {; return new Symbol(sym.NOMBRE, yycolumn, yyline, yytext());}
<YYINITIAL> (",")   {          Rtokens.add(new token(yytext()+"", "Coma", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));    return new Symbol(sym.COMA, yycolumn, yyline, yytext());}
<YYINITIAL> (":")   {       Rtokens.add(new token(yytext()+"", "Dos puntos", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));       return new Symbol(sym.DPUNTOS, yycolumn, yyline, yytext());}
<YYINITIAL> ("{")   {       Rtokens.add(new token(yytext()+"", "Llave abierta", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));       return new Symbol(sym.LLAVEA, yycolumn, yyline, yytext());}
<YYINITIAL> ("}")   {       Rtokens.add(new token(yytext()+"", "Llave cerrada", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));       return new Symbol(sym.LLAVEC, yycolumn, yyline, yytext());}

<YYINITIAL> {COMENTARIO}   {    Rtokens.add(new token(yytext()+"", "Comentario de linea", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));            }
<YYINITIAL> {COMENTARIOLINEAS}   {        Rtokens.add(new token(yytext()+"", "Comentario multilinea", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));             }
<YYINITIAL> {CADENA}   {          Rtokens.add(new token(yytext()+"", "Cadena", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));              return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}
<YYINITIAL> {NUMEROS}   {        Rtokens.add(new token(yytext()+"", "Numero", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));              return new Symbol(sym.NUMEROS, yycolumn, yyline, yytext());}
<YYINITIAL> {ID}   {             Rtokens.add(new token(yytext()+"", "Identificador", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));         return new Symbol(sym.ID, yycolumn, yyline, yytext());}


//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

. {
     erroresLexicos.add(new Excepcion(yytext()+"", "error lexico", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));
  
}