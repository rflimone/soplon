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
        
    @Test
    public void cargaDocumentoDesdeWeb() throws Exception{
        Dominios dominio = new Dominios("https://readms.net/manga/");
        assertTrue("getHashDominios: Hash es de largo erróneo.", dominio.getHashDominios().length() == 64);
        
        Ancla ancla = new Ancla(dominio,"https://readms.net/manga/");
        assertTrue("getHashAncla: Hash es de largo erróneo.", ancla.getHashAncla().length() == 64);
        
        Web web = new Web(ancla);
        web.cargaDocumentoDesdeWeb();
        
        assertTrue("web.getDocument() es null; El documento no fue cargado.", web.getDocument() != null);
    }
}