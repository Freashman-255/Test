package User.dao.school_market;

import User.pojo.BuyFood;
import User.pojo.BuyGoods;
import User.pojo.Goods;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;
import java.util.Map;

public class SchoolMarketMapperImpl implements SchoolMarketMapper{
    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Goods> init(String type) {
        return sqlSession.getMapper(SchoolMarketMapper.class).init(type);
    }

    @Override
    public int selectCount(String type) {
        return sqlSession.getMapper(SchoolMarketMapper.class).selectCount(type);
    }

    @Override
    public List<Goods> selectPage(Map map) {
        return sqlSession.getMapper(SchoolMarketMapper.class).selectPage(map);
    }

    @Override
    public int insertBuyGoodsList(BuyGoods buyGoods) {
        return sqlSession.getMapper(SchoolMarketMapper.class).insertBuyGoodsList(buyGoods);
    }

    @Override
    public List<BuyGoods> selectAllBuyGoodsList(String username) {
        return sqlSession.getMapper(SchoolMarketMapper.class).selectAllBuyGoodsList(username);
    }

    @Override
    public int selectBuyGoodsId(String gname) {
        return sqlSession.getMapper(SchoolMarketMapper.class).selectBuyGoodsId(gname);
    }

    @Override
    public int deleteBuyGoodsById(int id) {
        return sqlSession.getMapper(SchoolMarketMapper.class).deleteBuyGoodsById(id);
    }

    @Override
    public int deleteAllBuyGoodsList(String username) {
        return sqlSession.getMapper(SchoolMarketMapper.class).deleteAllBuyGoodsList(username);
    }

    @Override
    public Double sumGoods(String username) {
        return sqlSession.getMapper(SchoolMarketMapper.class).sumGoods(username);
    }

    @Override
    public int updateGoodsQuantity(String gname) {
        return sqlSession.getMapper(SchoolMarketMapper.class).updateGoodsQuantity(gname);
    }
}
