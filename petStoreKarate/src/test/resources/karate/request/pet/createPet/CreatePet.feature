Feature: Service client POST
  As AQ Automation
  I want to create a new pets
  To see in the petstore

  Background:
    * url url

  @test1
  Scenario: Create a pet with id 6

    * def requestBody = {"id":'6'}
    * def responseCreate = read ("classpath:karate/request/pet/createPet/responseCreatePet.json")

    Given path 'pet'
    And request requestBody
    When method POST
    Then status 200


  Scenario Outline: Create a pet with valid name and id with method POST

    * def requestBody = {"name":'#(name)',"id":'#(idCat)'}

    Given path 'pet'
    And request requestBody
    And params { "name": <name>, "id": <idCat> }
    When method POST
    Then status 200

    Examples:
    |name     |idCat  |
    |"pepito" |"9"    |
    |"PEPITO" |"25"   |
    |"pepe15" |"365"  |
    |"pepe-15"|"4983" |
    |"p"      |"26983"|
    |"P"      |""     |

  Scenario Outline: Create a pet with valid status with method POST

    * def bodyOk = read('classpath:karate/request/pet/createPet/responseCreatePet.json')
    * def requestBody = {"status":'#(status)'}

    Given path 'pet'
    And request requestBody
    And params { "status": <status>}
    When method POST
    Then status 200

    Examples:
    |status     |
    |"available"|
    |"pending"  |
    |"sold"     |

  Scenario Outline: Create a pet with invalid status with method POST

    * def requestBody = {"status":'#(status)'}

    Given  path 'pet'
    And request requestBody
    And params { "status": <status>}
    When method POST
    Then status 200

    Examples:
    |status |
    |""     |
    |"1"    |
    |"-1"   |
    |"a"    |
    |"A"    |
    |"#$%&" |