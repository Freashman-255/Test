package User.service.Login_Sign;

import User.pojo.User;

public interface Login_SignService {
    User queryUserService(String username, String password);
    int addUserService(User user);
}
