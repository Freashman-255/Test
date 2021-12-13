package User.dao.schoolService;

import User.pojo.ScholarShip;
import org.mybatis.spring.SqlSessionTemplate;

public class SchoolMapperImpl implements SchoolMapper {
    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public int insertScholarShip(ScholarShip scholarShip) {
        return sqlSession.getMapper(SchoolMapper.class).insertScholarShip(scholarShip);
    }
}
