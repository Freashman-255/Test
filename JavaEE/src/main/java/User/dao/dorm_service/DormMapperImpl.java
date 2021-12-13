package User.dao.dorm_service;

import User.pojo.ECard;
import User.pojo.Utilities;
import org.mybatis.spring.SqlSessionTemplate;

public class DormMapperImpl implements DormMapper{
    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public Double queryQuantity(int dno) {
        return sqlSession.getMapper(DormMapper.class).queryQuantity(dno);
    }

    @Override
    public Double queryCardQuantity(int sno) {
        return sqlSession.getMapper(DormMapper.class).queryCardQuantity(sno);
    }

    @Override
    public int updateCardQuantity(ECard card) {
        return sqlSession.getMapper(DormMapper.class).updateCardQuantity(card);
    }

    @Override
    public int updateQuantity(Utilities utilities) {
        int result=sqlSession.getMapper(DormMapper.class).updateQuantity(utilities);
        return result;
    }
}
