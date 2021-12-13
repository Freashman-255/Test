package User.controller;

import User.pojo.ECard;
import User.pojo.Utilities;
import User.service.Dorm_Service.DormServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.beans.XMLEncoder;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user")
public class DormServiceController {
    @Autowired
    private DormServiceImpl dormService;
    @RequestMapping("/queryQuantity")
    public void queryQuantity(int dno, HttpServletResponse response){
        Double result= dormService.queryQuantity(dno);
        try {
            PrintWriter out=response.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    @RequestMapping("/updateQuantity")
    public String updateQuantity(String dno,double money){
        Utilities utilities=new Utilities();
        utilities.setDno(dno);
        utilities.setQuantity(money);
        int result= dormService.updateQuantity(utilities);
        if (result==1){
            return "redirect:/success.jsp";
        }else {
            return "redirect:/error.jsp";
        }
    }
    @RequestMapping("/queryCardQuantity")
    public void queryCardQuantity(int sno,HttpServletResponse response){
        Double result=dormService.queryCardQuantity(sno);
        try {
            PrintWriter out=response.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("/updateCardQuantity")
    public String updateCardQuantity(String sno,double money){
        ECard card=new ECard();
        System.out.println(money);
        card.setSno(sno);
        card.setQuantity(money);
        int result=dormService.updateCardQuantity(card);
        if (result==1){
            return "redirect:/success.jsp";
        }else {
            return "redirect:/error.jsp";
        }
    }
}
