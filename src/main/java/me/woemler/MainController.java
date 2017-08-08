package me.woemler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author woemler
 */
@Controller
public class MainController {

  @RequestMapping("")
  public String home(){
    return "home";
  }

}
