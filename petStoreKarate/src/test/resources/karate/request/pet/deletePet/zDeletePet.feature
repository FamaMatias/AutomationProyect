Feature: Service client DELETE
  As AQ Automation
  I want to deletes pets
  To eliminate to the petstore

  Background:
    * url url

  Scenario: Deletes a valid pets with the method DELETE

  Given path 'pet','9'
  When method DELETE
  Then status 200

  Scenario Outline: Deletes a invalid pets with the method DELETE

  Given path <petId>
  When method DELETE
  Then status 404

  Examples:
  |petId |
  |5.56  |
  |-5    |
  |"a"   |
  |"A"   |
