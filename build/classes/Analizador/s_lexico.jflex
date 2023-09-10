package Analizador; 
import java_cup.runtime.*;


%%	
//-------> Directivas (No tocar)

%public 
%class Lexico
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

<YYINITIAL> ("int")        {   return new Symbol(sym.INTT,yycolumn, yyline, yytext());} 
<YYINITIAL> ("double") {   return new Symbol(sym.DOUBLEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("char")     {   return new Symbol(sym.CHARR,yycolumn, yyline, yytext());} 
<YYINITIAL> ("bool")     {   return new Symbol(sym.BOOLL,yycolumn, yyline, yytext());} 
<YYINITIAL> ("string")   {   return new Symbol(sym.STRINGG,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void main")      {   return new Symbol(sym.VOIDD,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void DefinirGlobales")      {   return new Symbol(sym.GLOBAL,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void GraficaBarras")      {   return new Symbol(sym.BARRAS,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void GraficaPie")      {   return new Symbol(sym.PIE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("NewValor")      {   return new Symbol(sym.NVALOR,yycolumn, yyline, yytext());} 
<YYINITIAL> ("if")          {   return new Symbol(sym.IFF,yycolumn, yyline, yytext());} 
<YYINITIAL> ("else if")   {   return new Symbol(sym.ELSEIF,yycolumn, yyline, yytext());} 
<YYINITIAL> ("else")   {   return new Symbol(sym.ELSEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("switch")   {   return new Symbol(sym.SWITCHH,yycolumn, yyline, yytext());} 
<YYINITIAL> ("case")     {   return new Symbol(sym.CASEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("break")   {   return new Symbol(sym.BREAKK,yycolumn, yyline, yytext());}
<YYINITIAL> ("default")   {   return new Symbol(sym.DEFAULTT,yycolumn, yyline, yytext());} 
<YYINITIAL> ("for")        {   return new Symbol(sym.FORR,yycolumn, yyline, yytext());} 
<YYINITIAL> ("while")     {   return new Symbol(sym.WHILEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("do")        {   return new Symbol(sym.DOO,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Console.Write")        {   return new Symbol(sym.PRINT,yycolumn, yyline, yytext());} 
<YYINITIAL> ("true")       {   return new Symbol(sym.VERDAD,yycolumn, yyline, yytext());} 
<YYINITIAL> ("false")        {   return new Symbol(sym.FALSO,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Titulo")        {   return new Symbol(sym.TITULO,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Ejex")        {   return new Symbol(sym.EJEX,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Valores")        {   return new Symbol(sym.VAL,yycolumn, yyline, yytext());} 
<YYINITIAL> ("TituloX")        {   return new Symbol(sym.TITULOX,yycolumn, yyline, yytext());} 
<YYINITIAL> ("TituloY")        {   return new Symbol(sym.TITULOY,yycolumn, yyline, yytext());} 


<YYINITIAL> ("+")   {          return new Symbol(sym.MAS, yycolumn, yyline, yytext());}
<YYINITIAL> ("-")   {            return new Symbol(sym.MENOS, yycolumn, yyline, yytext());}
<YYINITIAL> ("/")   {               return new Symbol(sym.DIVISION, yycolumn, yyline, yytext());}
<YYINITIAL> ("*")   {          return new Symbol(sym.MULTI, yycolumn, yyline, yytext());}
<YYINITIAL> (">")   {            return new Symbol(sym.MAYOR, yycolumn, yyline, yytext());}
<YYINITIAL> ("<")   {            return new Symbol(sym.MENOR, yycolumn, yyline, yytext());}
<YYINITIAL> (">=")   {                  return new Symbol(sym.MAYIGUAL, yycolumn, yyline, yytext());}
<YYINITIAL> ("<=")   {                  return new Symbol(sym.MENIGUAL, yycolumn, yyline, yytext());}
<YYINITIAL> ("==")   {            return new Symbol(sym.IGUAL, yycolumn, yyline, yytext());}
<YYINITIAL> ("!=")   {               return new Symbol(sym.DISTINTO, yycolumn, yyline, yytext());}
<YYINITIAL> ("&&")   {          return new Symbol(sym.ANDD, yycolumn, yyline, yytext());}
<YYINITIAL> ("||")   {         return new Symbol(sym.ORR, yycolumn, yyline, yytext());}
<YYINITIAL> ("=")   {;                  return new Symbol(sym.IGUALSIMPLE, yycolumn, yyline, yytext());}
<YYINITIAL> ("!")   {          return new Symbol(sym.NOT, yycolumn, yyline, yytext());}
<YYINITIAL> ("$")   {          return new Symbol(sym.DOLAR, yycolumn, yyline, yytext());}


<YYINITIAL> ("{")   {          return new Symbol(sym.LLAVEA, yycolumn, yyline, yytext());}
<YYINITIAL> ("}")   {          return new Symbol(sym.LLAVEC, yycolumn, yyline, yytext());}
<YYINITIAL> ("(")   {              return new Symbol(sym.PARENA, yycolumn, yyline, yytext());}
<YYINITIAL> (")")   {               return new Symbol(sym.PARENC, yycolumn, yyline, yytext());}
<YYINITIAL> ("[")   {              return new Symbol(sym.CORA, yycolumn, yyline, yytext());}
<YYINITIAL> ("]")   {               return new Symbol(sym.CORC, yycolumn, yyline, yytext());}
<YYINITIAL> (":")   {          return new Symbol(sym.DPUNTOS, yycolumn, yyline, yytext());}
<YYINITIAL> (";")   {          return new Symbol(sym.PUNTOCOMA, yycolumn, yyline, yytext());}
<YYINITIAL> (",")   {          return new Symbol(sym.COMA, yycolumn, yyline, yytext());}


<YYINITIAL> {COMENTARIO}   {             return new Symbol(sym.COMENT, yycolumn, yyline, yytext());}
<YYINITIAL> {COMENTARIOLINEAS}   {                   return new Symbol(sym.COMENTLINEA, yycolumn, yyline, yytext());}
<YYINITIAL> {CADENA}   {                    return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}
<YYINITIAL> {ID}   {                return new Symbol(sym.IDD, yycolumn, yyline, yytext());}
<YYINITIAL> {NUMEROS}   {;                    return new Symbol(sym.NUMEROS, yycolumn, yyline, yytext());}



//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }