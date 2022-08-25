Feature: Service client GET
  As AQ Automation
  I want to search for a pet by id
  To validate the status code and response

  Background:
    * url url

  Scenario: Filter pets with method GET

    Given path 'pet','8'
    When method GET
    Then status 200

  Scenario Outline: Filter pets with invalidate id using the method GET

    * def responseError = read('classpath:karate/request/pet/filterPetById/responseFilterPetsById.json')

    Given path 'pet',<id>
    When method GET
    Then status 404
    And match response == responseError

    Examples:
      |id    |
      |-5    |
      |5.56  |
      |"%&*+"|
      |"a"   |
      |"A"   |