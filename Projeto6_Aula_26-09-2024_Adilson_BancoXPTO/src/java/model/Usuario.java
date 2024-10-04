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
    //atribututos
        private String login;
        private String fone;
        private String email;
        private String senha;
    //metodos

        //setters
    public void setLogin(String p_login) {
        this.login = p_login;
    }

    public void setFone(String p_fone) {
        this.fone = p_fone;
    }

    public void setEmail(String p_email) {
        this.email = p_email;
    }

    public void setSenha(String p_senha) {
        this.senha = p_senha;
    }

    //getters
    public String getLogin() {
        return login;
    }

    public String getFone() {
        return fone;
    }

    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }
        
}
