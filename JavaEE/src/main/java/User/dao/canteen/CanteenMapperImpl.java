package User.dao.canteen;

import User.pojo.BuyFood;
import User.pojo.CanteenAdvice;
import User.pojo.SellFood;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;
import java.util.Map;

public class CanteenMapperImpl implements CanteenMapper{
    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public int addFeedbackRecord(CanteenAdvice canteenAdvice) {
        return sqlSession.getMapper(CanteenMapper.class).addFeedbackRecord(canteenAdvice);
    }

    @Override
    public List<SellFood> init() {
        return sqlSession.getMapper(CanteenMapper.class).init();
    }

    @Override
    public List<SellFood> queryPage(int page) {
        return sqlSession.getMapper(CanteenMapper.class).queryPage(page);
    }

    @Override
    public int foodCount() {
        return sqlSession.getMapper(CanteenMapper.class).foodCount();
    }

    @Override
    public int insertBuyList(BuyFood buyFood) {
        return sqlSession.getMapper(CanteenMapper.class).insertBuyList(buyFood);
    }

    @Override
    public int deleteBuyList(String username) {
        return sqlSession.getMapper(CanteenMapper.class).deleteBuyList(username);
    }

    @Override
    public List<BuyFood> queryBuyListByName(String username) {
        return sqlSession.getMapper(CanteenMapper.class).queryBuyListByName(username);
    }

    @Override
    public int queryListByFoodName(String food_name) {
        return sqlSession.getMapper(CanteenMapper.class).queryListByFoodName(food_name);
    }

    @Override
    public int deleteListByFoodId(int id) {
        return sqlSession.getMapper(CanteenMapper.class).deleteListByFoodId(id);
    }

    @Override
    public double selectPayCount(String username) {
        return sqlSession.getMapper(CanteenMapper.class).selectPayCount(username);
    }

    @Override
    public int updateSellFood(String foodName) {
        return sqlSession.getMapper(CanteenMapper.class).updateSellFood(foodName);
    }
}
