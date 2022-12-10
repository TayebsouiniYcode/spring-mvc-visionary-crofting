package com.company.app.config;


import com.company.app.entity.Invoice;
import com.company.app.entity.Stock;
import com.company.app.repository.InvoiceRepository;
import com.company.app.repository.ProviderRepository;
import com.company.app.repository.StockRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;

import java.util.List;
public class InvoiceConfig{
//    @Autowired
//    ProviderRepository providerRepository;
//    @Autowired
//    StockRepository stockRepository;
//    @Bean
//    CommandLineRunner commandLineRunnerInvoice ( InvoiceRepository invoiceRepository){
//        return args -> {
//            Invoice f = new Invoice("refproduct1234" ,"ref12234",providerRepository.findById(Long.parseLong("1")) ,
//                    new Stock ("ali","ali@gamal.com","1234","2723838","safi") , 2334);
//            Invoice j = new Invoice("refproduct8248" ,"ref3743",providerRepository.findById(Long.parseLong("2"),stockRepository.findById(Long.parseLong("1"))) , 2334);
//            Invoice a = new Invoice("refproduct8237" ,"ref8347",providerRepository.findById(Long.parseLong("1"),
//                    new Stock("ali","ali@gamal.com","1234","92374","safi") , 2334);
//            Invoice g = new Invoice("refproduct823" ,"ref9295",providerRepository.findById(Long.parseLong("1"),
//                    new Stock("ali","ali@gamal.com","1234","735838","safi") , 2334);
//
//            invoiceRepository.saveAll(List.of(f,j,a,g));
//        };
//    }

}