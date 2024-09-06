/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dados;
import java.util.Date;

/**
 *
 * @author Pedro Costa
 * data - 05.09.2024
 */
public class Funcionarios {
    //atributos 
    private int id;
    private String nome;
    private float salar;
    private Date nasc;
    
    //metodos - construtor 
    public Funcionarios() {
    }
    
    //metodos setter

    public void setId(int p_id) {
        this.id = p_id;
    }

    public void setNome(String p_nome) {
        this.nome = p_nome;
    }

    public void setSalar(float p_salar) {
        this.salar = p_salar;
    }

    public void setNasc(Date p_nasc) {
        this.nasc = p_nasc;
    }
    
    //metodos getter

    public int getId() {
        return this.id;
    }

    public String getNome() {
        return this.nome;
    }

    public float getSalar() {
        return this.salar;
    }

    public Date getNasc() {
        return this.nasc;
    }
    
    //metodos de negocio
    public float calcFerias(float p_salar){
        return p_salar/3;
    }    
}
