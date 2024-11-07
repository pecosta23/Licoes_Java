/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author alunocmc
 */
public class Calculinho1Test {
    
    Calculinho1 calc = new Calculinho1(); 
    
    public Calculinho1Test() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of MaiorNum method, of class Calculinho1.
     */
    @org.junit.Test
    
    public void testMaiorNum() {
        assertEquals(20, calc.MaiorNum(8, 7, 20));
    }

    /**
     * Test of MediaNota method, of class Calculinho1.
     */
    @org.junit.Test
    public void testMediaNota() {
        assertEquals(10, calc.MediaNota(10, 10, 10, 10));
    }

    /**
     * Test of Passou method, of class Calculinho1.
     */
    @org.junit.Test
    public void testPassou() {
        assertTrue(calc.Passou(7));
    }

    /**
     * Test of MediaPond method, of class Calculinho1.
     */
    @org.junit.Test
    public void testMediaPond() {
        assertEquals(10, calc.MediaPond(10, 10, 10));
    }


    
    
}
