/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pedro
 */
public class Usuario {
    //atributos
    private String usuario;
    private String senha;
    private String nome;
    
    //metodos

    public Usuario() {
    }

    public void setUsuario(String p_usuario) {
        this.usuario = p_usuario;
    }

    public void setSenha(String p_senha) {
        this.senha = p_senha;
    }
    
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public String getSenha() {
        return this.senha;
    }

    public String getNome() {
        return this.nome;
    }
    
}
