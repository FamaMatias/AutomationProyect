package karate.request;

import com.intuit.karate.junit5.Karate;

public class FilterPetsById {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/FilterPetsById.feature").relativeTo(getClass());
    }


}
