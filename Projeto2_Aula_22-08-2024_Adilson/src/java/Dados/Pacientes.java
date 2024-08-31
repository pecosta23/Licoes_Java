/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dados;

/**
 *
 * @author pedro
 */
public class Pacientes {
    //atributos
    private int id;
    String nome;
    float mensal;
    
    //metodos-set
    public void setId(int p_id){
        this.id = p_id;       
    }   
    public void setNome(String p_nom){
        this.nome = p_nom;
    }
    public void setMensal(float p_men){
        this.mensal = p_men;
    }
    
    //metodos-get
    public int getId(){
        return this.id;
    }
    public String getNome(){
        return this.nome;
    }
    public float getMensal(){
        return this.mensal;
    }
    
    //outros métodos
    //process
    public float calcDesc(float p_men){
        return this.getMensal()* 10/100;//promoção do mês, desconto de 10%
    }
}
