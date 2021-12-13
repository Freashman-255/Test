package User.controller;

import User.pojo.BuyGoods;
import User.pojo.Goods;
import User.service.SchoolMarket.SchoolMarketService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class SchoolMarketController {
    @Autowired
    private SchoolMarketService schoolMarketService;
    ObjectMapper objectMapper=new ObjectMapper();
    @RequestMapping("/goods_init")
    public void goods_init(@RequestParam("type") String type, HttpServletResponse response){
        List<Goods> list= schoolMarketService.init(type);
        int count= schoolMarketService.selectCountService(type);
        response.setContentType("application/json;charset=utf-8");
        Map map=new HashMap();
        map.put("data",list);
        if (count%4==0){
            map.put("count",count/4);
        }else {
            map.put("count",count/4+1);
        }
        try {
            String result= objectMapper.writeValueAsString(map);
            PrintWriter out= response.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/selectGoodsPage")
    public void selectGoodsPage(@RequestParam("type")String type,@RequestParam("page")String page,HttpServletResponse response){
        Map map=new HashMap();
        map.put("type",Integer.parseInt(type));
        map.put("page",Integer.parseInt(page));
        List<Goods> list= schoolMarketService.selectPageService(map);
        response.setContentType("application/json;charset=utf-8");
        try {
            PrintWriter out= response.getWriter();
            out.print(objectMapper.writeValueAsString(list));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/insertBuyGoodsListService")
    @ResponseBody
    public void insertBuyGoodsList(HttpSession session, @RequestParam("gname")String gname, @RequestParam("img_src")String img_src, @RequestParam("price")Double price){
        String username= (String) session.getAttribute("username");
        BuyGoods buyGoods=new BuyGoods();
        buyGoods.setPrice(price);
        buyGoods.setUsername(username);
        buyGoods.setImg_src(img_src);
        buyGoods.setGname(gname);
        schoolMarketService.insertBuyGoodsListService(buyGoods);
    }
    @RequestMapping("/selectAllBuyGoodsListService")
    @ResponseBody
    public void selectAllBuyGoodsList(HttpServletResponse response,HttpSession session){
        String username= (String) session.getAttribute("username");
        List<BuyGoods> buyGoodsList= schoolMarketService.selectAllBuyGoodsListService(username);
        response.setContentType("application/json;charset=utf-8");
        try {
            PrintWriter out= response.getWriter();
            out.print(objectMapper.writeValueAsString(buyGoodsList));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/deleteBuyGoodsList")
    public void deleteBuyGoodsList(@RequestParam("gname") String gname,HttpServletResponse response){
        int gid=schoolMarketService.selectBuyGoodsIdService(gname);
        int result=schoolMarketService.deleteBuyGoodsByIdService(gid);
        try {
            PrintWriter out= response.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/GoodsPay")
    public void GoodsPay(HttpSession session,HttpServletResponse response){
        String username= (String) session.getAttribute("username");
        double pay=schoolMarketService.sumGoodsService(username);
        List<BuyGoods> lists= schoolMarketService.selectAllBuyGoodsListService(username);
        for (BuyGoods list:lists
             ) {
            schoolMarketService.updateGoodsQuantity(list.getGname());
        }
        int deleteList=schoolMarketService.deleteAllBuyGoodsList(username);
        Map map=new HashMap();
        map.put("payCount",pay);
        map.put("deleteList",deleteList);
        try {
            PrintWriter out= response.getWriter();
            out.print(objectMapper.writeValueAsString(map));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
