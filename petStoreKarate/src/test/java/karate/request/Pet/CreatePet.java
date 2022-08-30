package karate.request.Pet;


import com.intuit.karate.junit5.Karate;

public class CreatePet {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/pet/createPet/CreatePet.feature").relativeTo(getClass());
    }
}
