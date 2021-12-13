package User.dao.dorm_service;

import User.pojo.ECard;
import User.pojo.Utilities;

public interface DormMapper {
    Double queryQuantity(int dno);
    int updateQuantity(Utilities utilities);
    Double queryCardQuantity(int sno);
    int updateCardQuantity(ECard card);
}
