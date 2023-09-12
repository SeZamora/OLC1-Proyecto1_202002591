/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Errores;

/**
 *
 * @author SEBASTIAN ZAMORA
 */
public class Excepcion {
    private String lexema;
    private String descripcion;
    private String linea;
    private String columna;

  

    public Excepcion(String lexema, String descripcion, String linea, String columna) {
        this.lexema = lexema;
        this.descripcion = descripcion;
        this.linea = linea;
        this.columna = columna;
    }
    
    public String getLexema() {
        return lexema;
    }

    public String getDescripcion(){
        return descripcion;
    }

    public String getLinea() {
        return linea;
    }

    public String getColumna() {
        return columna;
    }
    
}

