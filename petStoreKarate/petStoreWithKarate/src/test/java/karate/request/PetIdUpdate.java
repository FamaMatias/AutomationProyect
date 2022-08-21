package karate.request;

import com.intuit.karate.junit5.Karate;

public class PetIdUpdatePositive {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate.request/PetIdUpdatePositive.feature").relativeTo(getClass());
    }
}
