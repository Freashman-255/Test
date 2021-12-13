package User.service.SchoolMarket;

import User.pojo.BuyGoods;
import User.pojo.Goods;

import java.util.List;
import java.util.Map;

public interface SchoolMarketService {
    List<Goods> init(String type);

    int selectCountService(String type);

    List<Goods> selectPageService(Map map);

    int insertBuyGoodsListService(BuyGoods buyGoods);

    List<BuyGoods> selectAllBuyGoodsListService(String username);

    int selectBuyGoodsIdService(String gname);

    int deleteBuyGoodsByIdService(int id);

    int deleteAllBuyGoodsList(String username);

    int updateGoodsQuantity(String gname);

    Double sumGoodsService(String username);
}
