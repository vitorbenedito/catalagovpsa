package br.com.catalagovpsa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProdutosController {    

    @RequestMapping("/produtos")
    public String list(Map<String, Object> map) {

        

        return "/produtos/list";
    }
    
}
