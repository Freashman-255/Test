package User.service.Canteen;

import User.dao.canteen.CanteenMapper;
import User.pojo.BuyFood;
import User.pojo.CanteenAdvice;
import User.pojo.SellFood;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class CanteenServiceImpl implements CanteenService{
    private CanteenMapper canteenMapper;

    public void setCanteenMapper(CanteenMapper canteenMapper) {
        this.canteenMapper = canteenMapper;
    }

    @Override
    public int addFeedbackRecordService(CanteenAdvice canteenAdvice) {
        return canteenMapper.addFeedbackRecord(canteenAdvice);
    }

    @Override
    public List<SellFood> initService() {
        return canteenMapper.init();
    }

    @Override
    public List<SellFood> queryPageService(int page) {
        return canteenMapper.queryPage(page);
    }

    @Override
    public int foodCountService() {
        return canteenMapper.foodCount();
    }

    @Override
    public int insertBuyListService(BuyFood buyFood) {
        return canteenMapper.insertBuyList(buyFood);
    }

    @Override
    public int deleteBuyListService(String username) {
        return canteenMapper.deleteBuyList(username);
    }

    @Override
    public List<BuyFood> queryBuyListByNameService(String username) {
        return canteenMapper.queryBuyListByName(username);
    }

    @Override
    public int queryListByFoodNameService(String food_name) {
        return canteenMapper.queryListByFoodName(food_name);
    }

    @Override
    public int deleteListByFoodIdService(int id) {
        return canteenMapper.deleteListByFoodId(id);
    }

    @Override
    public double selectPayCount(String username) {
        return canteenMapper.selectPayCount(username);
    }

    @Override
    public int updateSellFood(String foodName) {
        return canteenMapper.updateSellFood(foodName);
    }
}
