package User.controller;

import User.pojo.BuyFood;
import User.pojo.CanteenAdvice;
import User.pojo.SellFood;
import User.service.Canteen.CanteenService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class CanteenController {
    @Autowired
    private CanteenService canteenService;


    @RequestMapping("/feedback")
    public String addRecord(CanteenAdvice canteenAdvice, HttpSession session){
        String username= (String) session.getAttribute("username");
        canteenAdvice.setUsername(username);
        int result=canteenService.addFeedbackRecordService(canteenAdvice);
        if (result==0){
            return "redirect:/error.jsp";
        }else {
            return "redirect:/success.jsp";
        }
    }
    @RequestMapping(value = "/Canteen_init")//,produces = "application/json;charset=utf-8"
    public void init(HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");//为啥这里设置就可以解决乱码的问题
        ObjectMapper objectMapper=new ObjectMapper();
        List<SellFood> list=canteenService.initService();
        int count= canteenService.foodCountService();
        Map map=new HashMap();
        map.put("data",list);
        if (count%4==0){
            map.put("count",count/4);
        }else {
            map.put("count",count/4+1);
        }

        try {
            PrintWriter out=response.getWriter();
            out.print(objectMapper.writeValueAsString(map));
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/canteenQueryPage")
    public void queryPage(@RequestParam("page") int page,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        ObjectMapper objectMapper=new ObjectMapper();
        try {
            PrintWriter out= response.getWriter();
            out.print(objectMapper.writeValueAsString(canteenService.queryPageService(page)));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/insertBuyList")
    //public void insertBuyList(BuyFood buyFood,HttpServletResponse response,HttpSession session){
    public void insertBuyList(BuyFood buyFood, HttpServletResponse response, HttpServletRequest request){
        String username= (String) request.getSession().getAttribute("username");
        System.out.println(username);
        buyFood.setUsername(username);
        int result=canteenService.insertBuyListService(buyFood);
        try {
            PrintWriter out=response.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    @RequestMapping("/queryBuyListByName")
    public void queryBuyListByName(HttpSession session,HttpServletResponse response){
        String username= (String) session.getAttribute("username");
        ObjectMapper objectMapper=new ObjectMapper();
        List<BuyFood> buyFoodList=canteenService.queryBuyListByNameService(username);
        response.setContentType("application/json;charset=utf-8");
        try {
            PrintWriter out= response.getWriter();
            out.print(objectMapper.writeValueAsString(buyFoodList));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteBuyListByFoodId")
    @ResponseBody
    public void deleteBuyListByFoodId(@RequestParam("food_name")String food_name,HttpServletResponse response){
        int id=canteenService.queryListByFoodNameService(food_name);
        int result=canteenService.deleteListByFoodIdService(id);
        try {
            PrintWriter out=response.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/Pay")
    public void pay(HttpSession session,HttpServletResponse response){
        String username= (String) session.getAttribute("username");
        double payCount=canteenService.selectPayCount(username);
        ObjectMapper objectMapper=new ObjectMapper();
        List<BuyFood> list=canteenService.queryBuyListByNameService(username);
        for (BuyFood buy:list
             ) {
            //更新sell_food表
            canteenService.updateSellFood(buy.getFood_name());
        }

        //删除所有改用的记录
        int deleteList=canteenService.deleteBuyListService(username);
        try {
            PrintWriter out=response.getWriter();
            Map map=new HashMap();
            map.put("payCount",payCount);
            map.put("deleteList",deleteList);
            out.print(objectMapper.writeValueAsString(map));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
