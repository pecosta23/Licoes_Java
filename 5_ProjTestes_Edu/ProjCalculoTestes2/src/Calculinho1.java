/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Calculinho1 {
    
    public int MaiorNum(int n1, int n2, int n3){
                return Math.max(n1,Math.max(n2,n3));
                
}       
    public int MediaNota(int n1, int n2, int n3, int n4){
        return (n1+n2+n3+n4)/4;
    }
    
    public boolean Passou(double media){
        if (media>=7){
           return true;
        }else{
            return false;
    }}
        
    public int MediaPond(int mat, int port, int natu){
        return (mat*2+port*1+natu*1)/4;
    }
}
