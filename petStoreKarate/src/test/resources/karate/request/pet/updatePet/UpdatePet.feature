Feature: Service client PUT
  As AQ Automation
  I want to update information for the pets
  To fix error when it was create

  Background:
    * url url

  Scenario Outline: Update a pet with valid name and id with method PUT
    * def requestBody = {"name":'#(name)',"job":'#(idCat)'}

    Given path 'pet'
    And request requestBody
    And params { "name": <name>, "job": <idCat> }
    When method PUT
    Then status 200

    Examples:
    |name     |idCat                    |
    |"pepito" |"9223372036854021536"    |
    |"PEPITO" |"25"                     |
    |"pepe15" |"365"                    |
    |"pepe-15"|"4983"                   |
    |"p"      |"26983"                  |
    |"P"      |""                       |

  Scenario Outline: Update a pet with valid status with method PUT

    * def requestBody = {"status":'#(status)'}

    Given path 'pet'
    And request requestBody
    And params { "status": <status>}
    When method PUT
    Then status 200

    Examples:
    |status     |
    |"available"|
    |"pending"  |
    |"sold"     |