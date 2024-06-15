package connect.nosql.mongodb.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import connect.nosql.mongodb.model.GroceryItem;
import connect.nosql.mongodb.repository.ItemRepository;

@RestController
public class TestController {
    @Autowired
    ItemRepository itemRepository;

    @GetMapping("/all")
    ResponseEntity<?> getAll(){
        return new ResponseEntity<>(itemRepository.findAll(),HttpStatus.OK);
    }

    @PostMapping("/insert")
    ResponseEntity<?> insert(@RequestParam Map<String, String> body) {
        System.out.println(body.toString());
        String id = body.get("id");
        String name = body.get("name");
        int quantity = Integer.parseInt(body.get("quantity"));
        String category = body.get("category");
        GroceryItem groceryItem = new GroceryItem(id, name, quantity, category);
        itemRepository.save(groceryItem);
        return new ResponseEntity<>(groceryItem, HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    ResponseEntity<?> delete(@RequestParam(name = "id") String id) {
        System.out.println(id);
        GroceryItem existingGroceryItem = itemRepository.findById(id).orElseThrow(() -> new RuntimeException("Item Not Found"));
        itemRepository.deleteById(id);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @GetMapping("/get/{name}")
    ResponseEntity<?> getByName(@PathVariable(name = "name") String name) {
        System.out.println(name);
        GroceryItem existingGroceryItem = itemRepository.findByName(name).orElseThrow(() -> new RuntimeException("Item Not Found"));
        return new ResponseEntity<>(existingGroceryItem, HttpStatus.OK);
    }

    @PutMapping("/update")
    ResponseEntity<?> update(@RequestParam Map<String,String> body){
        System.out.println(body.toString());
        GroceryItem existingGroceryItem = itemRepository.findById(body.get("id")).orElseThrow(() -> new RuntimeException("Item Not Found"));
        existingGroceryItem.setCategory(body.get("category"));
        existingGroceryItem.setName(body.get("name"));
        existingGroceryItem.setQuantity(Integer.parseInt(body.get("quantity")));
        GroceryItem savedGroceryItem = itemRepository.save(existingGroceryItem);
        return new ResponseEntity<>(savedGroceryItem, HttpStatus.OK);
    }
}
