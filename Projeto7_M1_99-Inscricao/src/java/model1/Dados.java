/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model1;

/**
 *
 * @author pedro
 * dia 1 06/10/2024 Criação do conexao banco de dados
 *                  realizado com sucesso batendo 200 ok
 *                  hora de adc atributos
 */

public class Dados {
    //atributos (oq ele vai bater lá no banco, 
    //os dados que queremos passar para a inscrição)
    private String nome;
    private String CPF;
    private String DDD;
    private String num;
    private String email;
    private String dtNasc;
    private String endereco;
    private boolean checkNews;
    
    
    //abaixo, realizando criação dos setters e getters
    //utilizando p_ para ficar mais fácil identificação de parâmetros
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }

    public void setCPF(String p_CPF) {
        this.CPF = p_CPF;
    }

    public void setDDD(String p_DDD) {
        this.DDD = p_DDD;
    }

    public void setNum(String p_num) {
        this.num = p_num;
    }

    public void setEmail(String p_email) {
        this.email = p_email;
    }

    public void setDtNasc(String p_dtNasc) {
        this.dtNasc = p_dtNasc;
    }

    public void setEndereco(String p_endereco) {
        this.endereco = p_endereco;
    }

    public void setCheckNews(boolean p_checkNews) {
        this.checkNews = p_checkNews;
    }
    
    //getters
    public String getNome() {
        return this.nome;
    }

    public String getCPF() {
        return this.CPF;
    }

    public String getDDD() {
        return this.DDD;
    }

    public String getNum() {
        return this.num;
    }

    public String getEmail() {
        return this.email;
    }

    public String getDtNasc() {
        return this.dtNasc;
    }

    public String getEndereco() {
        return this.endereco;
    } 

    public boolean getCheckNews() {
        return this.checkNews;
    }
}
