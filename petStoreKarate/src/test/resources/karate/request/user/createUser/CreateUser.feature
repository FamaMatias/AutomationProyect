Feature: Service client POST
  As AQ Automation
  I want to create a new user
  To use the aplication

  Background:
    * url url

  Scenario: Create a pet with valid name and id with method POST
    * def bodyOk = read('classpath:karate/request/pet/createPet/responseCreatePet.json')
    * def requestBody = read ('classpath:karate/request/user/createUser/requestCreateUser.json')

    Given path 'user'
    And request
    """
    {
  "id": "13",
"username": "mati",
"firstName": "pepito",
"lastName": "mati",
"email": "kjdlka@gmail.com",
"password": "546sdafds",
"phone": "516513513",
"userStatus": 5
}
    """
    When method POST
    Then status 200