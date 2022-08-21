Feature: Service client GET
  As AQ Automation
  I want to search for a pet by id
  To validate the status code and response

  Background:
    * url url

  Scenario Outline: Create a pet with valid name and id
    * def bodyOk = read('classpath:karate/request/responseCreateOk.json')

    Given path 'pet'
    And request
   """
    {
      "id": 8,
      "category": {
      "id": <idCat>,
      "name": <name>
    },
      "name": "doggie",
      "photoUrls": [
      "pepito.jpg"
      ],
      "tags": [
      {
        "id": 0,
        "name": "perrito"
      }
    ],
    "status": "available"
    }
   """
    When method POST
    Then status 200
    And match response == bodyOk

    Examples:
      |name     |idCat  |
      |"pepito" |"1"    |
      |"PEPITO" |"25"   |
      |"pepe15" |"365"  |
      |"pepe-15"|"4983" |
      |"p"      |"26983"|
      |"P"      |""     |

  Scenario Outline: Create a pet with invalid name

   Given path 'pet','8'
   And request
   """
    {
      "id": 8,
      "category": {
      "id": <idCat>,
      "name": <name>
    },
      "name": "doggie",
      "photoUrls": [
      "pepito.jpg"
      ],
      "tags": [
      {
        "id": 0,
        "name": "perrito"
      }
    ],
    "status": "available"
    }
   """
   When method POST
   Then status 415

  Examples:
  |name  |idCat   |
  |""    |""      |
  |1     |"pepito"|
  |-1    |"A"     |
  |"#$%&"|"#$%&"  |

  Scenario Outline: Create a pet with valid status

    * def bodyOk = read('classpath:karate/request/responseCreateOk.json')

    Given path 'pet'
    And request
   """
    {
      "id": 8,
      "category": {
      "id": 0,
      "name": "pepito"
    },
      "name": "doggie",
      "photoUrls": [
      "pepito.jpg"
      ],
      "tags": [
      {
        "id": 0,
        "name": "perrito"
      }
    ],
    "status": <status>
    }
   """
    When method POST
    Then status 200
    And match response == bodyOk

    Examples:
      |status     |
      |"available"|
      |"pending"  |
      |"sold"     |

  Scenario Outline: Create a pet with invalid status

    Given  path 'pet'
    And request
   """
    {
      "id": 8,
      "category": {
      "id": 0,
      "name": "pepito"
    },
      "name": "doggie",
      "photoUrls": [
      "pepito.jpg"
      ],
      "tags": [
      {
        "id": 0,
        "name": "perrito"
      }
    ],
    "status": <status>
    }
   """
    When method POST
    Then status 404

    Examples:
      |status |
      |""     |
      |"1"    |
      |"-1"   |
      |"a"    |
      |"A"    |
      |"#$%&" |
