package services;

import dao.PaginaDao;
import entities.Categoria;
import entities.Pagina;
import entities.Tag;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PaginaService {

    @Autowired
    private PaginaDao paginaDao;

    @Transactional(readOnly = true)
    public List<Pagina> getPaginas() {
        return paginaDao.getPaginas();
    }

    @Transactional(readOnly = true)
    public List<Pagina> findPaginasWithTag() {
        return paginaDao.findPaginasWithTag();
    }
    
    @Transactional(readOnly = true)
    public List<Pagina> findPaginasByTag(String glosa) {
        return paginaDao.findPaginasByTag(glosa);
    }

    @Transactional
    public Pagina insertPagina(Pagina pagina) {
        return paginaDao.savePagina(pagina);
    }

    @Transactional
    public void insertPaginas(List<Pagina> paginaList) {
        paginaList.forEach(pagina -> {
            paginaDao.savePagina(pagina);
        });
    }

    @Transactional
    public Pagina updatePagina(Pagina pagina) {
        return paginaDao.savePagina(pagina);
    }

    @Transactional
    public void updatePaginas(List<Pagina> paginaList) {
        paginaList.forEach(pagina -> {
            paginaDao.savePagina(pagina);
        });
    }

    @Transactional(readOnly = true)
    public Categoria findCategoria(Pagina p) {
        return paginaDao.findCategoria(p);
    }

    @Transactional(readOnly = true)
    public List<Tag> findTag(Pagina p) {
        return paginaDao.findTag(p);
    }

    @Transactional(readOnly = true)
    public List<Pagina> findPaginasByCat(String categoria) {
        return paginaDao.findByCategoria(categoria);
    }
}
