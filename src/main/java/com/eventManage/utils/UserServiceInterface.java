package com.eventManage.utils;
import com.eventManage.model.User;

import java.io.IOException;

public interface UserServiceInterface {

    //Declare methods
    void registerUser(User user, String filePath) throws IOException;

    User authenticate(String username, String password, String filePath) throws IOException;

    boolean updateUser(String username, String newEmail, String newPassword, String filePath) throws IOException;
}
