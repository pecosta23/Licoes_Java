/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pedro
 */
public class dados {
    //atributos
    private String nome;
    private String email;
    private String nasc;

    //constructor
    public dados() {
    }

    //setters
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }

    public void setEmail(String p_email) {
        this.email = p_email;
    }

    public void setNasc(String p_nasc) {
        this.nasc = p_nasc;
    }
    
    //getters
    public String getNome() {
        return this.nome;
    }

    public String getEmail() {
        return this.email;
    }

    public String getNasc() {
        return this.nasc;
    }
}
