package com.company.app.controller;

import com.company.app.classes.Cart;
import com.company.app.classes.Message;
import com.company.app.classes.PasserCommande;
import com.company.app.classes.ProductListForm;
import com.company.app.entity.Client;
import com.company.app.entity.Product;
import com.company.app.service.ClientService;
import com.company.app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
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

    @RequestMapping(path = "/client/addtocart/{productReference}", method = RequestMethod.GET)
    public String addProductToCart( @ModelAttribute("cart") Cart cart,
                                    Model model,
                                    @PathVariable String  productReference ){
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

    /*
        ToDo
        compare reference and choice One
     */
    @RequestMapping(path = "/cart")
    public String cart(@ModelAttribute("cart") Cart cart, Model model){
        List<String> productReferenceList = cart.getProductReferences ();
        List<Product> productList = new ArrayList <> ();
        productReferenceList.stream ().forEach ( (reference) -> {
            productList.add ( productService.getProductByReference ( reference ) );
        } );

        model.addAttribute ( "client", clientService.getFirstClient() );
        model.addAttribute ( "products", productList );
        return "product/cart";
    }

    /*
        ToDo

        **** refactoring
     */
    @RequestMapping(path = "/passer_commande/{idClient}", method = RequestMethod.POST)
    public String passerCommand(Model model,
                                @PathVariable Long idClient,
                                @ModelAttribute("productListForm") ProductListForm productListForm,
                                @ModelAttribute("cart") Cart cart )

    {
        if (idClient != null && idClient > 0) {
            String[] productList = productListForm.toString ().split ( "/" );
            Collection< PasserCommande> passerCommandes = new ArrayList <> (  );
            PasserCommande passerCommande = new PasserCommande (  );

            for ( int i = 0 ; i < productList.length ; i++ ) {
                String[] referenceQuantity = productList[i].split ( "," );
                passerCommande.setRef ( referenceQuantity[0] );
                passerCommande.setQuantity ( Integer.parseInt ( referenceQuantity[1]) );
                passerCommandes.add ( passerCommande );
            }
            clientService.passerCommande(idClient, passerCommandes);
        }
        cart.clear();
        model.addAttribute ( "products" , productService.getProducts () );
        return "product/products";
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


    @PostMapping("/passer_command/{idClient}")
    @ResponseBody
    public Client passerCommande(@PathVariable Long idClient,@RequestBody Collection< PasserCommande > productList)
    {
        return clientService.passerCommande(idClient, productList);
    }

}
