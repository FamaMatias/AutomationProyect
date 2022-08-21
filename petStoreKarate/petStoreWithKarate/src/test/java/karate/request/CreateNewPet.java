package karate.request;

import com.intuit.karate.junit5.Karate;

public class CreateNewPetPositive {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate.request/CreateNewPetPositive.feature").relativeTo(getClass());
    }
}
