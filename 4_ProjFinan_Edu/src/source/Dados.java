/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package source;

/**
 * dia 1 -> 05/10/2024 banco de dados já estruturado
 *          adicionei o driver myslq connector
 *          criação dessa classe e métodos
 *          coloco p_ nos setters para indentificar 
 *          parâmetros mais facilmente, dica do adilson
 * @author pedro
 */
public class Dados {
    //atributos
    private double valorFinanciado;
    private int numParcelas;
    private double taxaJuros;

    //abaixo setters e getters
    public void setValorFinanciado(double p_valorFinanciado) {
        this.valorFinanciado = p_valorFinanciado;
    }

    public void setNumParcelas(int p_numParcelas) {
        this.numParcelas = p_numParcelas;
    }

    public void setTaxaJuros(double p_taxaJuros) {
        this.taxaJuros = p_taxaJuros;
    }

    public double getValorFinanciado() {
        return valorFinanciado;
    }

    public int getNumParcelas() {
        return numParcelas;
    }

    public double getTaxaJuros() {
        return taxaJuros;
    } 
}
