/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DatosJson;

import java.util.HashMap;

/**
 *
 * @author SEBASTIAN ZAMORA
 */
public class Jsons {
    private String name;
    private HashMap<String, Variable>variables;

    public Jsons(String name) {
        this.name = name;
        this.variables = new HashMap<>();
    }

    public void addVariable(String variableName, String simboloName) {
        variables.put(variableName, new Variable(variableName, simboloName));
    }

    public String getSimbolo(String variableName) {
        if (variables.containsKey(variableName)) {
            return variables.get(variableName).getSimbolo();
        }
        return "variable no encontrado.";
    }
    
    public HashMap<String, Variable> getVariables() {
        return variables;
    }
}
