package karate.request;

import com.intuit.karate.junit5.Karate;

public class CreateNewPetNegative {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate.request/CreateNewPetNegative.feature").relativeTo(getClass());
    }

}
