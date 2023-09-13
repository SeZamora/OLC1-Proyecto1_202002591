package Analizador; 
import java_cup.runtime.*;
import Errores.Excepcion;
import Tokens.token;
import java.util.ArrayList;
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

        // crear un arraylist para los errores lexicos
       ArrayList<Excepcion> erroresLexicos = new ArrayList<Excepcion>() ;
        // array tokens
       ArrayList<token> Rtokens = new ArrayList<token>() ;
       
        public ArrayList<token> ArrayToken(){
            return Rtokens;
       }
        public ArrayList<Excepcion> ArrayError(){
                   return erroresLexicos;
              }

            public void LimpiarLex(){
                  erroresLexicos.clear();
              }
            public void LimpiarToken(){
                  Rtokens.clear();
              }
       

%} 

//expresion regular
COMENTARIO = "//" [^"\n"]+
COMENTARIOLINEAS =  [/][*][^\!\>]*[*][/]
CADENA = ([\"][^\n\"]+[\"])|([\'][^\n\']+[\']) 
ID = [a-zA-Z][a-zA-Z0-9_]* 
NUMEROS = ([0-9]+)(\.[0-9]+)?

%%

<YYINITIAL> ("int")        { Rtokens.add(new token(yytext()+"", "Tipos de Dato", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.INTT,yycolumn, yyline, yytext());} 
<YYINITIAL> ("double") {  Rtokens.add(new token(yytext()+"", "Tipos de Dato", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.DOUBLEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("char")     { Rtokens.add(new token(yytext()+"", "Tipos de Dato", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.CHARR,yycolumn, yyline, yytext());} 
<YYINITIAL> ("bool")     { Rtokens.add(new token(yytext()+"", "Tipos de Dato", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.BOOLL,yycolumn, yyline, yytext());} 
<YYINITIAL> ("string")   { Rtokens.add(new token(yytext()+"", "Tipos de Dato", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.STRINGG,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void main")      { Rtokens.add(new token(yytext()+"", "Declaración del main", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.VOIDD,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void DefinirGlobales")      { Rtokens.add(new token(yytext()+"", "Declaración Variables Globales", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   return new Symbol(sym.GLOBAL,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void GraficaBarras")      {  Rtokens.add(new token(yytext()+"", "Declaración Gráfica de Barras", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.BARRAS,yycolumn, yyline, yytext());} 
<YYINITIAL> ("void GraficaPie")      { Rtokens.add(new token(yytext()+"", "Declaración Gráfica de Pie", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   return new Symbol(sym.PIE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("NewValor")      { Rtokens.add(new token(yytext()+"", "<NewValor>", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));           return new Symbol(sym.NVALOR,yycolumn, yyline, yytext());} 
<YYINITIAL> ("if")          { Rtokens.add(new token(yytext()+"", "Sentencia IF", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   return new Symbol(sym.IFF,yycolumn, yyline, yytext());} 
<YYINITIAL> ("else if")   {   Rtokens.add(new token(yytext()+"", "Sentencia Else If", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.ELSEIF,yycolumn, yyline, yytext());} 
<YYINITIAL> ("else")   {   Rtokens.add(new token(yytext()+"", "Setencia Else", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.ELSEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("switch")   {  Rtokens.add(new token(yytext()+"", "Sentencia Switch", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.SWITCHH,yycolumn, yyline, yytext());} 
<YYINITIAL> ("case")     {  Rtokens.add(new token(yytext()+"", "Sentencia Case", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.CASEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("break")   {  Rtokens.add(new token(yytext()+"", "Break", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.BREAKK,yycolumn, yyline, yytext());}
<YYINITIAL> ("default")   {  Rtokens.add(new token(yytext()+"", "Default", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.DEFAULTT,yycolumn, yyline, yytext());} 
<YYINITIAL> ("for")        {   Rtokens.add(new token(yytext()+"", "Sentencia For", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.FORR,yycolumn, yyline, yytext());} 
<YYINITIAL> ("while")     {    Rtokens.add(new token(yytext()+"", "Sentencia While", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));return new Symbol(sym.WHILEE,yycolumn, yyline, yytext());} 
<YYINITIAL> ("do")        {  Rtokens.add(new token(yytext()+"", "Sentencia Do", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.DOO,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Console.Write")        {   Rtokens.add(new token(yytext()+"", "Sentencia Imprimir", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.PRINT,yycolumn, yyline, yytext());} 
<YYINITIAL> ("true")       {  Rtokens.add(new token(yytext()+"", "Valor Booleano", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.VERDAD,yycolumn, yyline, yytext());} 
<YYINITIAL> ("false")        {  Rtokens.add(new token(yytext()+"", "Valor Booleano", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.FALSO,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Titulo")        { Rtokens.add(new token(yytext()+"", "Palabra reservada Titulo", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   return new Symbol(sym.TITULO,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Ejex")        {  Rtokens.add(new token(yytext()+"", "Palabra reservada Eje X", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.EJEX,yycolumn, yyline, yytext());} 
<YYINITIAL> ("Valores")        { Rtokens.add(new token(yytext()+"", "Palabra reservada Valores", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   return new Symbol(sym.VAL,yycolumn, yyline, yytext());} 
<YYINITIAL> ("TituloX")        {  Rtokens.add(new token(yytext()+"", "Palabra reservada Titulos X", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.TITULOX,yycolumn, yyline, yytext());} 
<YYINITIAL> ("TituloY")        {  Rtokens.add(new token(yytext()+"", "Palabra reservada Titulo Y", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));  return new Symbol(sym.TITULOY,yycolumn, yyline, yytext());} 


<YYINITIAL> ("+")   {      Rtokens.add(new token(yytext()+"", "Operacion Aritmetica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   System.out.println("encontro suma");  return new Symbol(sym.MAS, yycolumn, yyline, yytext());}
<YYINITIAL> ("-")   {       Rtokens.add(new token(yytext()+"", "Operacion Aritmetica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.MENOS, yycolumn, yyline, yytext());}
<YYINITIAL> ("/")   {         Rtokens.add(new token(yytext()+"", "Operacion Aritmetica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));      System.out.println("encontro division"); return new Symbol(sym.DIVISION, yycolumn, yyline, yytext());}
<YYINITIAL> ("*")   {      Rtokens.add(new token(yytext()+"", "Operacion Aritmetica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));    return new Symbol(sym.MULTI, yycolumn, yyline, yytext());}
<YYINITIAL> (">")   {       Rtokens.add(new token(yytext()+"", "Operacion Racionale", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.MAYOR, yycolumn, yyline, yytext());}
<YYINITIAL> ("<")   {      Rtokens.add(new token(yytext()+"", "Operacion Racionale", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));       return new Symbol(sym.MENOR, yycolumn, yyline, yytext());}
<YYINITIAL> (">=")   {           Rtokens.add(new token(yytext()+"", "Operacion Racionale", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));        return new Symbol(sym.MAYIGUAL, yycolumn, yyline, yytext());}
<YYINITIAL> ("<=")   {           Rtokens.add(new token(yytext()+"", "Operacion Racionale", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));        return new Symbol(sym.MENIGUAL, yycolumn, yyline, yytext());}
<YYINITIAL> ("!")   {      Rtokens.add(new token(yytext()+"", "Operacion Logica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.NOTT, yycolumn, yyline, yytext());}
<YYINITIAL> ("==")   {       Rtokens.add(new token(yytext()+"", "Operacion Racionale", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));      return new Symbol(sym.IGUAL, yycolumn, yyline, yytext());}
<YYINITIAL> ("!=")   {          Rtokens.add(new token(yytext()+"", "Operacion Racionale", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));      return new Symbol(sym.DISTINTO, yycolumn, yyline, yytext());}
<YYINITIAL> ("&&")   {        Rtokens.add(new token(yytext()+"", "Operacion Logica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));   return new Symbol(sym.ANDD, yycolumn, yyline, yytext());}
<YYINITIAL> ("||")   {          Rtokens.add(new token(yytext()+"", "Operacion Logica", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));    return new Symbol(sym.ORR, yycolumn, yyline, yytext());}
<YYINITIAL> ("=")   {;          Rtokens.add(new token(yytext()+"", "Signo =", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));            return new Symbol(sym.IGUALSIMPLE, yycolumn, yyline, yytext());}
<YYINITIAL> ("$")   {         Rtokens.add(new token(yytext()+"", "Signo $", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.DOLAR, yycolumn, yyline, yytext());}


<YYINITIAL> ("{")   {        Rtokens.add(new token(yytext()+"", "Llave abierta", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));      return new Symbol(sym.LLAVEA, yycolumn, yyline, yytext());}
<YYINITIAL> ("}")   {         Rtokens.add(new token(yytext()+"", "Llave Cierra", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.LLAVEC, yycolumn, yyline, yytext());}
<YYINITIAL> ("(")   {         Rtokens.add(new token(yytext()+"", "Parentesis abierto", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));         return new Symbol(sym.PARENA, yycolumn, yyline, yytext());}
<YYINITIAL> (")")   {           Rtokens.add(new token(yytext()+"", "Parentensis cerrado", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));        return new Symbol(sym.PARENC, yycolumn, yyline, yytext());}
<YYINITIAL> ("[")   {         Rtokens.add(new token(yytext()+"", "Corchete abierto", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));         return new Symbol(sym.CORA, yycolumn, yyline, yytext());}
<YYINITIAL> ("]")   {            Rtokens.add(new token(yytext()+"", "Corchete Cerrado", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));       return new Symbol(sym.CORC, yycolumn, yyline, yytext());}
<YYINITIAL> (":")   {         Rtokens.add(new token(yytext()+"", "Dos puntos", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.DPUNTOS, yycolumn, yyline, yytext());}
<YYINITIAL> (";")   {         Rtokens.add(new token(yytext()+"", "Punto coma", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));     return new Symbol(sym.PUNTOCOMA, yycolumn, yyline, yytext());}
<YYINITIAL> (",")   {          Rtokens.add(new token(yytext()+"", "coma", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));    return new Symbol(sym.COMA, yycolumn, yyline, yytext());}


<YYINITIAL> {COMENTARIO}   {           Rtokens.add(new token(yytext()+"", "Comentario de una linea", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));      System.out.println("se encontro un Comentario linea");}
<YYINITIAL> {COMENTARIOLINEAS}   {        Rtokens.add(new token(yytext()+"", "Comentario multilinea", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));      System.out.println("se encontro un comentarioLineas");}
<YYINITIAL> {CADENA}   {           Rtokens.add(new token(yytext()+"", "Cadena", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));             return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}
<YYINITIAL> {ID}   {          Rtokens.add(new token(yytext()+"", "Identificador", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));          return new Symbol(sym.IDD, yycolumn, yyline, yytext());}
<YYINITIAL> {NUMEROS}   {;              Rtokens.add(new token(yytext()+"", "Numero" , Integer.toString(yyline+1), Integer.toString(yycolumn+1)));          return new Symbol(sym.NUMEROS, yycolumn, yyline, yytext());}



//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

. {
     erroresLexicos.add(new Excepcion(yytext()+"", "error lexico", Integer.toString(yyline+1), Integer.toString(yycolumn+1)));
  
}
