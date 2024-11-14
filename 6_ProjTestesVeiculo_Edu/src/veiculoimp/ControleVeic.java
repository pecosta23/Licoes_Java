/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veiculoimp;
/**
 *
 * @author alunocmc
 */
public class ControleVeic {  
    public double CalcImp(double valor, int ano){
        int IdadeVeic = 2024 - ano;
        
       if(IdadeVeic <=2){
           return valor*0.05;
       }else if(IdadeVeic <=5){
           return valor*0.02;   
       }else return valor*0.01;  
    }
}
