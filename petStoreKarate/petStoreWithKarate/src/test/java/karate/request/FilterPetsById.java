package karate.request;

import com.intuit.karate.junit5.Karate;

public class FilterPetsByIdPositive {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate.request/FilterPetsByIdPositive.feature").relativeTo(getClass());
    }
}
