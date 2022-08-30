package karate.request.User;

import com.intuit.karate.junit5.Karate;

public class LoginUser {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/user/loginUser/LoginUser.feature").relativeTo(getClass());
    }
}
