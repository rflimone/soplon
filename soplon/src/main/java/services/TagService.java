package services;

import dao.TagDao;
import entities.Tag;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TagService {
    @Autowired
    private TagDao tagDao;

    @Transactional(readOnly = true)
    public List<Tag> getTag() {
        return tagDao.getTag();
    }

    @Transactional
    public void updateTag(Tag tag) {
        tagDao.updateTag(tag);
    }

    @Transactional
    public void insertTag(Tag tag) {
        tagDao.insertTag(tag);
    }

    @Transactional(readOnly = true)
    public Tag findByGlosa(String glosa) {
        return  tagDao.findByGlosa(glosa);
    }

    @Transactional(readOnly = true)
    public Tag findSubscripcionesByTag(String glosa) {
        return  tagDao.findSubscripcionesByTag(glosa);
    }

    @Transactional(readOnly = false)
    public Tag save(Tag tag) {
        return tagDao.save(tag);
    }

    public Tag findWithPaginas(Integer id) {
        return  tagDao.findWithPaginas(id);
    }

    public List<Tag> findWithPaginas() {
        return tagDao.findWithPaginas();
    }
}
