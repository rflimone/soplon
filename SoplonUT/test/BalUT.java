/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BAL.Ancla;
import BAL.Dominios;
import BAL.Web;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author rflimone
 */
public class BalUT {
    
    public BalUT() {
    }
    
    @Test
    public void cargaDocumentoDesdeWeb(){
        Dominios dominio = new Dominios("1234-124","https://readms.net/manga/");
        Ancla ancla = new Ancla(dominio,"1234-124","https://readms.net/manga/");
        Web web = new Web(ancla);
        web.cargaDocumentoDesdeWeb();
        
        assertTrue("Resultado de prueba", web.getDocument() != null);
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
