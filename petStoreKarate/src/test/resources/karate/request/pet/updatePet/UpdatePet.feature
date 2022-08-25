Feature: Service client PUT
  As AQ Automation
  I want to update information for the pets
  To fix error when it was create

  Background:
    * url url

  Scenario Outline: Update a pet with valid name and id with method PUT
    * def bodyOk = read('classpath:karate/request/pet/updatePet/responseUpdatePetOk.json')

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
    When method PUT
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

  Scenario Outline: Update a pet with invalid name and id with method PUT

    Given path 'pet'
    And request
   """
    {
      "id": <idCat>,
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
    Then status 500

    Examples:
      |name  |idCat   |
      |  {}  | {}     |
      |"#$%&"|"#$%&"  |

  Scenario Outline: Update a pet with valid status with method PUT

    * def bodyOk = read('classpath:karate/request/pet/updatePet/responseUpdatePetOk.json')

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

  Scenario Outline: Update a pet with invalid status with method PUT

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
    Then status 400

    Examples:
      |status  |
      |        |
      |-       |