Feature: Service client GET
  As AQ Automation
  I want to search for a pet by id
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: Check the service GET method

    Given path 'pet','5'
    When method GET
    Then status 200

  Scenario Outline: GET a pet with invalid values an id in the url
    * def responseError = read('classpath:karate/request/responseErrorFilterPetById.json')

    Given path 'pet',<id>
    When method GET
    Then status 404
    And match response == responseError

    Examples:
      |id         |
      |-5         |
      |"%&*+"     |
      |"numeroUno"|