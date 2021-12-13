package User.service.Canteen;


import User.pojo.BuyFood;
import User.pojo.CanteenAdvice;
import User.pojo.SellFood;

import java.util.List;
import java.util.Map;

public interface CanteenService {
    int addFeedbackRecordService(CanteenAdvice canteenAdvice);

    List<SellFood> initService();

    List<SellFood> queryPageService(int page);

    int foodCountService();

    int insertBuyListService(BuyFood buyFood);

    int deleteBuyListService(String username);

    List<BuyFood> queryBuyListByNameService(String username);

    int queryListByFoodNameService(String food_name);

    int deleteListByFoodIdService(int id);

    double selectPayCount(String username);

    int updateSellFood(String foodName);
}
