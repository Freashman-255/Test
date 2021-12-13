package User.service.Study;

import User.dao.study.StudyMapper;
import User.pojo.Book;
import User.pojo.Seat;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class StudyServiceImpl implements StudyService{
    private StudyMapper studyMapper;
    @Autowired
    public void setStudyMapper(StudyMapper studyMapper) {
        this.studyMapper = studyMapper;
    }

    @Override
    public List<Seat> init() {
        return studyMapper.init();
    }

    @Override
    public int changeSeatStateService(Seat seat) {
        return studyMapper.changeSeatState(seat);
    }

    @Override
    public List<Book> firstPageInitService() {
        return studyMapper.firstPageInit();
    }

    @Override
    public int selectCountService() {
        return studyMapper.selectCount();
    }

    @Override
    public List<Book> pageService(int cur_page) {
        return studyMapper.pageQuery(cur_page);
    }

    @Override
    public List<Book> fuzzyQueryService(Map map) {
        return studyMapper.fuzzyQuery(map);
    }
}
