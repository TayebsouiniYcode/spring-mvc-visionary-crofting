package com.company.app.controller;


import com.company.app.entity.Command;
import com.company.app.service.CommandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;


@RestController
@RequestMapping(path = "api/command")
public class CommandController {


    private final CommandService commandService;

    @Autowired
    public CommandController(CommandService commandService) {
        this.commandService = commandService;
    }

    @PostMapping("/addcommand")
    public Command addNewCommand( @RequestBody Command command){
        return commandService.addNewCommand(command);
    }
    @GetMapping
    public List<Command> getAllCommand(){
       return commandService.getCommand();
    }

    @DeleteMapping(path = "/{id}")
    public Integer deleteCommand(@PathVariable("id")Long id){
        return  commandService.deleteCommand(id);};

 @PutMapping(path = "/{id}")
   public  void updateCommand(
           @PathVariable("id")Long id,
           @RequestParam(required = false) String ref,
           @RequestParam(required = false) String dateTime,
           @RequestParam(required = false) String address,
           @RequestParam(required = false) int totalPrice
     ){

       commandService.updateCommand(id,ref,dateTime,address,totalPrice);

   }

    @PutMapping(path = "/update")
    public Command updateCommand(@RequestBody  Command command){
        commandService.updateCommand(command);
        return command;
    }


}
