package User.controller;

import User.pojo.User;
import User.service.Login_Sign.Login_SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class Login_SignController {
    @Autowired
    private Login_SignService login_signService;


    @RequestMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session,HttpServletRequest request){
        User user=login_signService.queryUserService(username, password);
        session.setAttribute("username",username);
        if (user!=null && user.getUsertype()==1){//并没有添加错误的设置,可以使用el表达式来完成登录成功和失败的提示
            //System.out.println("index");
            return "index";
        }else if(user!=null && user.getUsertype()==0){
            //System.out.println("admin");
            return "forward:/admin/studyroom_manage.jsp";
        }else {
            request.setAttribute("error","账号或者密码错误");
            return "forward:/login.jsp";
        }
    }
    @RequestMapping("/sign")
    public String sign(User user, Model model){
        int result=login_signService.addUserService(user);
        if (result==0){
            return "redirect:/error.jsp";
        }else {
            model.addAttribute("msg","添加成功");
            return "redirect:/success.jsp";
        }
    }
}
