Feature: Service client DELETE
  As AQ Automation
  I want to deletes pets
  To eliminate to the petstore

  Background:
    * url url

  Scenario: Deletes a valid pets with the method DELETE

    * def responseOk = read('classpath:karate/request/responseErrorFilterPetById.json')

  Given path 'pet','5'
  When method DELETE
  Then status 200
  And match response == responseOk

  Scenario Outline: Deletes a invalid pets with the method DELETE

    * def responseInvOk = read('classpath:karate/request/responseErrorFilterPetById.json')

  Given path <petId>
  When method DELETE
  Then status 404
  And match response == responseInvOk

    Examples:
    |petId |
    |5.56  |
    |-5    |
    |"a"   |
    |"A"   |
