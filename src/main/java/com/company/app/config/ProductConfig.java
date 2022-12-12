package com.company.app.config;

import com.company.app.entity.Product;
import com.company.app.repository.ProductRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class ProductConfig {

    @Bean
    CommandLineRunner commandLineRunner3 ( ProductRepository productRepository){
        return args -> {
            Product product1 = new Product ( "r1", "PC HP", 3000.00, "Les ordinateurs portables et 2 en-1 XPS ", "informatique", 40, 15 );
            Product product2 = new Product ( "r2", "PC DELL", 120000.00, "Les ordinateurs portables et 2 en-1 XPS ", "informatique", 40, 10 );
            Product product3 = new Product ( "r3", "MacBook pro", 30000.0, "Les ordinateurs portables et 2 en-1 XPS ", "informatique", 40, 2 );
            productRepository.saveAll ( List.of ( product1, product2, product3 ));
        };
    }
}
