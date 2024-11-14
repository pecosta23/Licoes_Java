/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veiculoimp;

/**
 *
 * @author alunocmc
 */
public class Veiculo {
    
    public String proprietario;
    public int ano;
    private double valor;
    
    public void setProprietario(String proprietario) {
        this.proprietario = proprietario;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getProprietario() {
        return proprietario;
    }

    public int getAno() {
        return ano;
    }

    public double getValor() {
        return valor;
    }   
}


