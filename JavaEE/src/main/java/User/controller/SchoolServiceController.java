package User.controller;

import User.pojo.ScholarShip;
import User.service.SchoolService.SchoolServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class SchoolServiceController {
    @Autowired
    private SchoolServiceImpl schoolService;
    @RequestMapping("/insertScholarShip")
    public String insertScholarShip(ScholarShip scholarShip){
        scholarShip.setState(0);
        int result= schoolService.insertScholarShip(scholarShip);
        if (result==1)
        {
            return "redirect:/success.jsp";
        }else {
            return "redirect:/error.jsp";
        }
    }
}
