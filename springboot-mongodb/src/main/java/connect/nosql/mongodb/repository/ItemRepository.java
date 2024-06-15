package connect.nosql.mongodb.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import java.util.List;
import java.util.Optional;

import connect.nosql.mongodb.model.GroceryItem;

public interface ItemRepository extends MongoRepository<GroceryItem, String> {
    
    @Query("{name:'?0'}")
    Optional<GroceryItem> findByName(String name);
    
    @Query("{id: '?0'}")
    Optional<GroceryItem> findById(String id);

    // Return field name and quantity
    @Query(value="{category:'?0'}", fields="{'name' : 1, 'quantity' : 1}")
    List<GroceryItem> findAll(String category);
    
    public long count();

}