package karate.request;

import com.intuit.karate.junit5.Karate;

public class DeletesPet {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/4DeletesPet.feature").relativeTo(getClass());
    }
}
