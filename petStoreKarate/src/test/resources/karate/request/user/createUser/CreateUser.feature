Feature: Service client POST
  As AQ Automation
  I want to create a new pets
  To see in the petstore

  Background:
    * url url

  Scenario Outline: Create a pet with valid name and id with method POST
    * def bodyOk = read('classpath:karate/request/pet/createPet/responseCreatePet.json')

    Given path 'pet'
    And request
   """
{
  "id": {{$randomInt}},
  "username": "{{$randomUserName}}",
  "firstName": "{{$randomFirstName}}",
  "lastName": "{{$randomLastName}}",
  "email": "{{$randomEmail}}",
  "password": "{{$randomPassword}}",
  "phone": "{{$randomPhoneNumber}}",
  "userStatus": 5
}
   """
    When method POST
    Then status 200