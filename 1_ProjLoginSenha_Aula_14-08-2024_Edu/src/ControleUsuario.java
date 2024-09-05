
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class ControleUsuario {
    
    Usuario usuario = new Usuario();
    
    public void Logar(String log, int sen){
        usuario.login = log;
        usuario.senha = sen;
        
        if(usuario.login.equals("edu")&& usuario.senha == 1234){
            new FormSistema().setVisible(true);   
        }
        else{
            JOptionPane.showMessageDialog(null, "login ou Senha incorretos!");
            new FormLogin().setVisible(true);
        }
    }

}