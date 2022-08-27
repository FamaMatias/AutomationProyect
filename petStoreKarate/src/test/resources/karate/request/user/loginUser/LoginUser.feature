Feature: Service client GET
  As AQ Automation
  I want to search for a pet by id
  To validate the status code and response

  Background:
    * url url

  Scenario: Filter pets with method GET

    * def bodyOk = read('classpath:karate/request/user/loginUser/responseLoginUser.json')

    Given path 'user','login'
    When method GET
    And request
    """
    {
    "username": "pepito",
    "password": "546sdafds"
    }
    """
    Then status 200
    And match response == bodyOk