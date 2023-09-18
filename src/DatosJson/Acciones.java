/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatosJson;

import java.util.HashMap;

public class Acciones {
    private HashMap<String, Jsons> jsons;

    public Acciones() {
        this.jsons = new HashMap<>();
    }

    public void createJson(String jsonName) {
        jsons.put(jsonName, new Jsons(jsonName));
        System.out.println("Json  '" + jsonName + "' creado.");
    }

    public void addVariable(String jsonName, String variableName, String simboloName) {
        if (jsons.containsKey(jsonName)) {
            jsons.get(jsonName).addVariable(variableName, simboloName);
            System.out.println("Variable '" + variableName + "' agregado a '" + jsonName + "'.");
        } else {
            System.out.println("Nombre Json: '" + jsonName + "' no encontrado.");
        }
    }

    public String obtenerSimb(String jsonName, String variableName) {
        if (jsons.containsKey(jsonName)) {
            String simbolo = jsons.get(jsonName).getSimbolo(variableName);
            System.out.println("El simbolo de '" + variableName + "' en el Json '" + jsonName + "' es: " + simbolo);
            return simbolo;
        } else {
            System.out.println("Nombre Json: '" + jsonName + "' no encontrado.");
             return null;
        }

    }
    
        public void printAllData() {
            for (String jsonName : jsons.keySet()) {
                System.out.println("Json: " + jsonName);
                Jsons json = jsons.get(jsonName);

                for (String variableName : json.getVariables().keySet()) {
                    String simbolo = json.getSimbolo(variableName);
                    System.out.println("   Variable: " + variableName);
                    System.out.println("   Contenido: " + simbolo);
                }
            }
}

}
