/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Analizador;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java_cup.runtime.Symbol;
/**
 *
 * @author SEBASTIAN ZAMORA
 */
public class PruebaJflex {
 
    public static void main(String[] args) {
        String input = "\'?\'";
        System.out.println(input);
        Lexico lexer = new Lexico(new BufferedReader(new StringReader(input)));
        
        try {
            Symbol token;
            while ((token = lexer.next_token()).sym != sym.EOF) {
                System.out.println("Token: " + token);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

