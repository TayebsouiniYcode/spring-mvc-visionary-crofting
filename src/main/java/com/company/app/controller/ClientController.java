package com.company.app.controller;


import com.company.app.classes.Cart;
import com.company.app.classes.Message;
import com.company.app.classes.PasserCommande;
import com.company.app.entity.Client;
import com.company.app.service.ClientService;
import com.company.app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Controller
//@RequestMapping(path = "visionarycrofting/Client")
@SessionAttributes("cart")
public class ClientController {
    @ModelAttribute("cart")
    public Cart cart() {
        return new Cart ();
    }

    @Autowired
    private ProductService productService;
    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/Clients")
    @ResponseBody
    public List< Client > getClients()
    {
        return clientService.getClients();
    }

    @GetMapping("/{client_id}")
    public Optional<Client> getOne(@PathVariable("client_id") Long clientId){
        return clientService.getOneById(clientId);
    }

    @RequestMapping(path = "/client/addtocart/{productReference}")
    public String addProductToCart( @ModelAttribute("cart") Cart cart,Model model, @PathVariable String  productReference ){
        if ( cart != null) {
            cart.setProductReferences(productReference);
            model.addAttribute("cart", cart);
        } else {
            Cart cart_ = new Cart ();
            cart.setProductReferences(productReference);
            model.addAttribute("cart", cart);
        }
        model.addAttribute ( "products", productService.getProducts () );
        return "product/products";
    }

    @RequestMapping(path = "/showcart")
    public String showCart(@ModelAttribute("cart") Cart cart){
        if (cart != null) {
            System.out.println (cart.toString () );
            return "product/products";
        } else {
            return "product/products";
        }
    }

    @PostMapping("/addClient")
    public Client registerNewClient(@RequestBody Client client)
    {
        return clientService.addClient(client);
    }

    @DeleteMapping(path = "deleteClient/{clientId}")
    public Message deleteClient( @PathVariable("clientId") Long clientId)
    {
        return clientService.deleteClient(clientId);
    }

    @PutMapping(path = "/updateClient")
    public Client updateClient(@RequestBody Client client)

    {
        return clientService.updateClient(client);
    }


    @PostMapping("/passer_commande/{idClient}")
    @ResponseBody
    public Client passerCommande(@PathVariable Long idClient,@RequestBody Collection< PasserCommande > productList)
    {
        return clientService.passerCommande(idClient, productList);
    }

}
