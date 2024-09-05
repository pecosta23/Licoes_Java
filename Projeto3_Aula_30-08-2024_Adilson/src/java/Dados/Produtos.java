/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dados;

/**
 *
 * @author pedro
 */
public class Produtos {
    //atributos 
    private int id;
    private String nome;
    private float valor;
    private float valorDois;
    
    //metodos

    public Produtos() {
    }

    public Produtos(int id, String nome, float valor, float valor2) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.valorDois = valor2;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
    
    public void setValor2(float valor) {
        this.valor = valor;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public float getValor() {
        return valor;
    }
    
    public float getValor2() {
        return valor;
    }
    
    public float calcDesc(float p_valor){
        //return (p_valor * 10/100);
        return (p_valor * 10/100);
    }
    
    public float calcDesc20(float p_valor2){
        //return (p_valor * 10/100);
        return (p_valor2 * 20/100);
    }
    
    
    
}

