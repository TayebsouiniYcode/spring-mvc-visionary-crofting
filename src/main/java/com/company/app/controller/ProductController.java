package com.company.app.controller;

import com.company.app.classes.Message;
import com.company.app.entity.Product;
import com.company.app.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping(path="/products", method=RequestMethod.GET)
    public String products(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute ( "products", products );
        return "product/products";
    }

    @RequestMapping(path = "/product/{id}", method=RequestMethod.GET)
    public String productDetail(Model model, @PathVariable Long id){
        Product product = productService.getProductById ( id );

        model.addAttribute ( "product", product );
        return "product/details";
    }

    @RequestMapping(path = "/addproduct", method = RequestMethod.GET)
    public String addProduct(){
        return "product/addproduct";
    }

    @RequestMapping(path = "/addproduct", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product) {
        boolean isValide = true;
        Message message = new Message (  );

        if (product.getProductReference () == null) {
            product.setProductReference ( "ref" + product.getName () + "-" + LocalDate.now ( ) );
//            isValide = !isValide;
//            message.setState ( "Error" );
//            message.setMessage ( "Reference does not null value" );
//            product.setMessage ( message );
        } else if (product.getQuantity () == null){
            isValide = !isValide;
            message.setState ( "Error" );
            message.setMessage ( "Quantity does not null value" );
            product.setMessage ( message );
        }else if (product.getQuantity () < 1){
            isValide = !isValide;
            message.setState ( "Error" );
            message.setMessage ( "Quantity does not negative or equal zero value" );
            product.setMessage ( message );
        } else if (product.getMinQuantity () < 0){
            isValide = !isValide;
            message.setState ( "Error" );
            message.setMessage ( "Quantity Min does not negative value" );
            product.setMessage ( message );
        } else if (product.getCategory () == null){
            isValide = !isValide;
            message.setState ( "Error" );
            message.setMessage ( "Category does not null value" );
            product.setMessage ( message );
        } else if (product.getName () == null) {
            isValide = !isValide;
            message.setState ( "Error" );
            message.setMessage ( "Name does not negative value" );
            product.setMessage ( message );
        }

        if (isValide) {
            message.setState ( "Success" );
            message.setMessage ( "your product has been successfully created" );
            product.setMessage ( message );
            productService.addProduct(product);
            return "redirect:/dashboard";
        } else return "redirect:/dashboard";
    }

    @RequestMapping(path = "/deleteproduct/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/dashboard";
    }



    @GetMapping("/productList")
    @ResponseBody
    public List < Product > getClients()
    {
        return productService.getProducts();
    }

    @PutMapping("/updateproduct")
    @ResponseBody
    public Product updateProduct(@RequestBody Product product) {
        return productService.updateProduct(product);
    }
}
