package com.company.app.controller;

import com.company.app.classes.Cart;
import com.company.app.classes.Login;
import com.company.app.entity.Client;
import com.company.app.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
//@SessionAttributes("client")
public class AuthController {
//    @ModelAttribute("client")
//    public Client client() {return new Client();}

    @Autowired
    private ClientService clientService;

    @RequestMapping(path = "/login", method = RequestMethod.GET)
    public String login(){
        return "admin/login";
    }

    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public String login( @ModelAttribute("login") Login login, HttpSession session ){

        Client client = clientService.getClientByEmail(login.getEmail ());

        if (client.getMessage ().getState ().equals ( "Success" )){
            if (client.getPassword ().equals ( login.getPassword () )){
                session.setAttribute ( "client", client );
                return "redirect:/dashboard";
            } else {
                return "redirect:/login";
            }
        } else {
            return "redirect:/login";
        }
    }
}
