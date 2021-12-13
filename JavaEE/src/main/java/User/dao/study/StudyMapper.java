package User.dao.study;

import User.pojo.Book;
import User.pojo.Seat;

import java.util.List;
import java.util.Map;

public interface StudyMapper {
    //初始化座位信息
    List<Seat> init();

    //作为状态信息修改
    int changeSeatState(Seat seat);

    //表格第一页初始化
    List<Book> firstPageInit();

    //查询数据库中所有的记录
    int selectCount();

    //下一页,上一页，页跳转
    List<Book> pageQuery(int cur_page);

    //根据输入的书名和作者进行模糊查询
    List<Book> fuzzyQuery(Map map);
}
