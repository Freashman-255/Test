package User.dao.Login_Sign;

import User.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface Login_SignMapper {
    User queryUser(@Param("username") String username, @Param("password") String password);
    int addUser(User user);
}
