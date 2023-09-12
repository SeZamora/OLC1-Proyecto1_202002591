/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Tokens;

/**
 *
 * @author SEBASTIAN ZAMORA
 */
public class token {
      private String lexema;
    private String token;
    private String linea;
    private String columna;

  

    public token(String lexema, String token, String linea, String columna) {
        this.lexema = lexema;
        this.token = token;
        this.linea = linea;
        this.columna = columna;
    }
    
    public String getLexema() {
        return lexema;
    }

    public String getToken(){
        return token;
    }

    public String getLinea() {
        return linea;
    }

    public String getColumna() {
        return columna;
    }
}
