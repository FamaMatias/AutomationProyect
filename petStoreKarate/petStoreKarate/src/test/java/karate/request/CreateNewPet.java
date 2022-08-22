package karate.request;

import com.intuit.karate.junit5.Karate;

public class CreateNewPet {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/1CreateNewPet.feature").relativeTo(getClass());
    }
}
