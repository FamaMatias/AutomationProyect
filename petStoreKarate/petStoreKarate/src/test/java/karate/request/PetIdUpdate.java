package karate.request;

import com.intuit.karate.junit5.Karate;

public class PetIdUpdate {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/3PetIdUpdate.feature").relativeTo(getClass());
    }
}
