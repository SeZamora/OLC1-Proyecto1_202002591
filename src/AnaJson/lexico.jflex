package AnaJson; 
import java_cup.runtime.*;


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
%} 

//expresion regular
COMENTARIO = [//][^"\n"]+
COMENTARIOLINEAS = [/][*][^\!\>]*[*][/]
CADENA = ([\"][^\n\"]+[\"])|([\'][^\n\']+[\']) 
ID = [a-zA-Z][a-zA-Z0-9_]* 
NUMEROS = ([0-9]+)(\.[0-9]+)?

%%
<YYINITIAL> ("NombreJson")   {;                    return new Symbol(sym.NOMBRE, yycolumn, yyline, yytext());}
<YYINITIAL> (",")   {          return new Symbol(sym.COMA, yycolumn, yyline, yytext());}
<YYINITIAL> (":")   {          return new Symbol(sym.DPUNTOS, yycolumn, yyline, yytext());}
<YYINITIAL> ("{")   {          return new Symbol(sym.LLAVEA, yycolumn, yyline, yytext());}
<YYINITIAL> ("}")   {          return new Symbol(sym.LLAVEC, yycolumn, yyline, yytext());}

<YYINITIAL> {COMENTARIO}   {             return new Symbol(sym.COMENT, yycolumn, yyline, yytext());}
<YYINITIAL> {COMENTARIOLINEAS}   {                   return new Symbol(sym.COMENTLINEA, yycolumn, yyline, yytext());}
<YYINITIAL> {CADENA}   {                    return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}
<YYINITIAL> {NUMEROS}   {                  return new Symbol(sym.NUMEROS, yycolumn, yyline, yytext());}
<YYINITIAL> {ID}   {                  return new Symbol(sym.ID, yycolumn, yyline, yytext());}


//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }
