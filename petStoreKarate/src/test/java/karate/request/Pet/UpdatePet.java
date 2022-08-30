package karate.request.Pet;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;


public class UpdatePet {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/pet/updatePet/UpdatePet.feature").relativeTo(getClass());
    }
}
