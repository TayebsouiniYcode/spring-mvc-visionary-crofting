package com.company.app.controller;

import com.company.app.classes.AppelDoffre;
import com.company.app.classes.Message;
import com.company.app.entity.Invoice;
import com.company.app.entity.Product;
import com.company.app.entity.Stock;
import com.company.app.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path="/visionarycrofting/stock")
public class StockController {
    @Autowired
    StockService stockService;
    @GetMapping
    @ResponseBody
    public List< Stock > findAll(){
        return stockService.findAll();
    }


    //    @RequestMapping(value = "/add",method = RequestMethod.POST,consumes =MediaType.APPLICATION_JSON_VALUE ,
//            headers = MediaType.APPLICATION_JSON_VALUE)
    @PostMapping(path = "/insert")
    @ResponseBody
    public Stock insertStock(@RequestBody Stock stock){

//        Stock stockObj = new Gson().fromJson(String.valueOf(stock), Stock.class);
         stockService.insertStock(stock);
        return stock;
    }

    @DeleteMapping(path = "/delete/{stockid}")
    @ResponseBody
    public Message deleteStockById( @PathVariable("stockid") Long id){
        return stockService.deleteStockById(id);
    }

    @PutMapping(path = "/update/{stockid}")
    @ResponseBody
    public Stock updateStock(
            @PathVariable("stockid") Long id , @RequestBody Stock stock){
       return stockService.updateStock(id , stock);
    }

    @PostMapping(path = "/addInvoice")
    @ResponseBody
    public Invoice addInvoice( @RequestBody AppelDoffre appelDoffre){
        return  stockService.addAppelDoffre(appelDoffre);
    }

    @PostMapping("/addproduct/{id}")
    @ResponseBody
    public Stock addProduct(@PathVariable Long id, @RequestBody Product product){
        return stockService.addProduct(id, product);
    }
}
