package User.dao.study;

import User.pojo.Book;
import User.pojo.Seat;
import org.mybatis.spring.SqlSessionTemplate;


import java.util.List;
import java.util.Map;

public class StudyMapperImpl implements StudyMapper{
    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Seat> init() {
        return sqlSession.getMapper(StudyMapper.class).init();
    }

    @Override
    public int changeSeatState(Seat seat) {
        return sqlSession.getMapper(StudyMapper.class).changeSeatState(seat);
    }

    @Override
    public List<Book> firstPageInit() {
        return sqlSession.getMapper(StudyMapper.class).firstPageInit();
    }

    @Override
    public int selectCount() {
        return sqlSession.getMapper(StudyMapper.class).selectCount();
    }

    @Override
    public List<Book> pageQuery(int cur_page) {
        return sqlSession.getMapper(StudyMapper.class).pageQuery(cur_page);
    }

    @Override
    public List<Book> fuzzyQuery(Map map) {
        return sqlSession.getMapper(StudyMapper.class).fuzzyQuery(map);
    }
}
