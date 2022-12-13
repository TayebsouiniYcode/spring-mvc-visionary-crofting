package com.company.app.controller;

import com.company.app.entity.Client;
import com.company.app.entity.Command;
import com.company.app.entity.Product;
import com.company.app.service.ClientService;
import com.company.app.service.CommandService;
import com.company.app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private ClientService clientService;
    @Autowired
    private ProductService productService;
    @Autowired
    private CommandService commandService;


    @RequestMapping(path = "/dashboard", method = RequestMethod.GET)
    public String dashboard( Model model,
                             HttpSession session ){

        if (session.getAttribute ( "client" ) == null ) {
            return "redirect:/login";
        }
        List< Client > clients = clientService.getClients ();
        List< Command > commands = commandService.getCommand ();
        List<Product> products = productService.getProducts ();

        model.addAttribute ( "clients", clients );
        model.addAttribute ( "commands", commands );
        model.addAttribute ( "products", products );

        return "admin/dashboard";
    }

}
