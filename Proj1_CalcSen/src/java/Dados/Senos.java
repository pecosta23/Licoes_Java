/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dados;

/**
 *
 * @author pedro
 */
public class Senos {
    //atributos
    private float Sen;
    
    public Senos(){    
    }
    //metodos
    public Senos(float Sen){
        this.Sen = Sen;
    }
    
    //set
    public void setSen(float Sen){
        this.Sen = Sen;
    }
    //get
    public float getSen(){
        return Sen;
    }
    
    public float CalcSen(float p_valor){
        return (p_valor * 85/100);
    }
    
}

