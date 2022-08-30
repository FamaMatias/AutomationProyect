package karate.request.User;

import com.intuit.karate.junit5.Karate;
public class CreateUser {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/user/createUser/CreateUser.feature").relativeTo(getClass());
    }
}
