/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Tokens;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/**
 *
 * @author SEBASTIAN ZAMORA
 */
public class HtmlToken {
            private static String imprimirhtml = "<!DOCTYPE html>\n" +
"<html>\n" +
"<head>\n" +
"	<title> Reporte de tokens</title>\n" +
"	<style>\n" +
"		table {\n" +
"			font-family: Arial, sans-serif;\n" +
"			border-collapse: collapse;\n" +
"			width: 100%;\n" +
"			margin-bottom: 20px;\n" +
"		}\n" +
"\n" +
"		th,\n" +
"		td {\n" +
"			border: 1px solid #ddd;\n" +
"			text-align: left;\n" +
"			padding: 8px;\n" +
"		}\n" +
"\n" +
"		th {\n" +
"			background-color: #f2f2f2;\n" +
"			color: #444;\n" +
"		}\n" +
"\n" +
"		tr:nth-child(even) {\n" +
"			background-color: #f2f2f2;\n" +
"		}\n" +
"\n" +
"		tr:hover {\n" +
"			background-color: #ddd;\n" +
"		}\n" +
"	</style>\n" +
"</head>\n" +
"<body>\n" +
"	<table>\n" +
"		<thead>\n" +
"			<tr>\n" +
"				<th>Tipo</th>\n" +
"				<th>Descripcion</th>\n" +
"				<th>Linea</th>\n" +
"				<th>Columna</th>\n" +
"			</tr>\n" +
"		</thead>\n" +
"		<tbody>";
    
   public static void insertarToken(String contenido){
                String enviar = "";
              enviar =   imprimirhtml + contenido + "</tbody>\n" +
"	</table>\n" +
"</body>\n" +
"</html>";
        EscribirArchivo(enviar, "./Reportes/Tokens.html");
    }

    

       public static void EscribirArchivo(String contenido, String ruta){
        try {

            File file = new File(ruta);
            // Si el archivo no existe es creado
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(contenido);
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        

    }
}
