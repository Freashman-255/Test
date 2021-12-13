package User.service.Dorm_Service;


import User.pojo.ECard;
import User.pojo.Utilities;

public interface DormService {
    Double queryQuantity(int dno);
    int updateQuantity(Utilities utilities);
    Double queryCardQuantity(int sno);
    int updateCardQuantity(ECard card);
}
