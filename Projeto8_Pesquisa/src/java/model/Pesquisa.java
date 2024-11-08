/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pedro
 */
public class Pesquisa {
    //atributos
    private int ID;
    private String nome;
    private String email;
    private int Q1;
    private int Q2;
    private int Q3;
    private int Q4;
    private int Q5;
    
    //constructor
    public Pesquisa() {
    }
     
    //set e get

    public void setID(int ID) {
        this.ID = ID;
    }
     
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setQ1(int Q1) {
        this.Q1 = Q1;
    }

    public void setQ2(int Q2) {
        this.Q2 = Q2;
    }

    public void setQ3(int Q3) {
        this.Q3 = Q3;
    }

    public void setQ4(int Q4) {
        this.Q4 = Q4;
    }

    public void setQ5(int Q5) {
        this.Q5 = Q5;
    }

    public int getID() {
        return ID;
    }
    
    public int getQ1() {
        return Q1;
    }

    public int getQ2() {
        return Q2;
    }

    public int getQ3() {
        return Q3;
    }

    public int getQ4() {
        return Q4;
    }

    public int getQ5() {
        return Q5;
    }

    public String getNome() {
        return nome;
    }

    public String getEmail() {
        return email;
    }
}
