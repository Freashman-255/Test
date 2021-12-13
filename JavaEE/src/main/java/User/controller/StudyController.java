package User.controller;

import User.pojo.Book;
import User.pojo.Seat;
import User.service.Study.StudyService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class StudyController {
    @Autowired
    private StudyService studyService;
    @RequestMapping("/Study_init")
    public void init(HttpServletResponse response){
        List<Seat> seatList= studyService.init();
        ObjectMapper mapper=new ObjectMapper();
        try {
            response.setContentType("application/json;charset=utf-8");
            String json_data= mapper.writeValueAsString(seatList);
            PrintWriter out= response.getWriter();
            out.print(json_data);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/changeSeatState",produces = "application/text;charset=utf-8")
    @ResponseBody
    public String changeSeatState(Seat seat){
        int result=studyService.changeSeatStateService(seat);
        if (result==1){
            return "操作成功";
        }else {
            return "操作失败";
        }
    }

    @RequestMapping("/firstPageInit")
    public void firstPageInit(HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        try {
            Map map=new HashMap();
            ObjectMapper mapper=new ObjectMapper();
            map.put("book_info",studyService.firstPageInitService());
            int book_count=studyService.selectCountService();
            if (book_count%4==0){
                map.put("book_count",book_count/4);
            }else {
                map.put("book_count",book_count/4+1);
            }
            String json= mapper.writeValueAsString(map);
            PrintWriter out= response.getWriter();
            out.print(json);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/PageService")
    public void nextPageService(@RequestParam("cur_page") int currentPage,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        ObjectMapper json=new ObjectMapper();
        List<Book> result= studyService.pageService(currentPage);
        try {
            PrintWriter out=response.getWriter();
            out.print(json.writeValueAsString(result));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/fuzzyQueryService")
    public void fuzzyQueryService(@RequestParam("author") String author,@RequestParam("bname")String bname,HttpServletResponse response){
        Map map=new HashMap();
        map.put("author",author);
        map.put("bname",bname);
        List<Book> result=studyService.fuzzyQueryService(map);
        response.setContentType("application/json;charset=utf-8");
        ObjectMapper mapper=new ObjectMapper();
        try {
            String json= mapper.writeValueAsString(result);
            PrintWriter out= response.getWriter();
            out.print(json);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
