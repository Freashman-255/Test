package User.service.Study;

import User.pojo.Book;
import User.pojo.Seat;

import java.util.List;
import java.util.Map;

public interface StudyService {
    List<Seat> init();

    int changeSeatStateService(Seat seat);

    List<Book> firstPageInitService();

    int selectCountService();

    List<Book> pageService(int cur_page);

    List<Book> fuzzyQueryService(Map map);
}
