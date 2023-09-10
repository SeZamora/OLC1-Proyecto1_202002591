package VariablesGlobales;
import olc1.proyecto1_202002591.Interfaz;
import java.util.HashMap;

public class FuncionesGlobales {
    private HashMap<String, String> variablesMap;

    public FuncionesGlobales() {
        variablesMap = new HashMap<>();
    }

    public void agregarVariable(String variable, String valores) {
        variablesMap.put(variable, valores);
        System.out.println("Se agregó la variable: " + variable + " con el valor: " + valores);
    }

    public String obtenerValor(String variable) {
        return variablesMap.get(variable);
    }
}
