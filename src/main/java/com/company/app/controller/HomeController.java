package com.company.app.controller;

import com.company.app.entity.Product;
import com.company.app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @RequestMapping({ "/"})
    public String home( Model model) {
        List< Product > productList = productService.getProducts ();
        model.addAttribute ( "products", productList );
        return "index";
    }
}
