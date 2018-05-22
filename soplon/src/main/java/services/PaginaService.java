package services;

import dao.PaginaDao;
import entities.Pagina;
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

    @Transactional
    public void insertPagina(Pagina pagina) {
        paginaDao.insertPagina(pagina);
    }

    @Transactional
    public void insertPaginas(List<Pagina> paginaList) {
        paginaDao.insertPaginas(paginaList);
    }

    @Transactional
    public void updatePagina(Pagina pagina) {
        paginaDao.updatePagina(pagina);
    }

    @Transactional
    public void updatePaginas(List<Pagina> paginaList) {
        paginaDao.updatePaginas(paginaList);
    }

}
