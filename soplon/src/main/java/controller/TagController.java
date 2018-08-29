package controller;

import services.TagService;
import entities.Tag;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TagController {

    @Autowired
    private TagService tagService;

    @GetMapping(value = "/tag/get-all")
    public List<Tag> getTag() {
        return tagService.getTag();
    }

    @GetMapping(value = "/private/tag", produces = "application/json")
    public Tag findSubscripcionesByTag(@RequestParam String glosa) {
        return tagService.findSubscripcionesByTag(glosa);
    }

    @PostMapping(value = "/tag/update-tag")
    public ResponseEntity<?> postTag(@RequestBody Tag tag) {
        tagService.updateTag(tag);
        return ResponseEntity.ok("OK");
    }

    @PostMapping(value = "/tag/insert-tag")
    public ResponseEntity<?> insertTag(@RequestBody Tag tag) {
        tagService.insertTag(tag);
        return ResponseEntity.ok("OK");
    }

}
