@Regression
Feature: To validate the Get endpoint
  To validate the Get endpoint response
  
  Background: set up the base url
  Given url 'https://reqres.in'
  
  #First way to use match keyword using equal operatior
  @Smoke
  Scenario: To get all the data from the application in JSON format using match equals variable
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response ==
    """
    { "page": 1,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 1,
      "name": "cerulean",
      "year": 2000,
      "color": "#98B2D1",
      "pantone_value": "15-4020"
    },
    {
      "id": 2,
      "name": "fuchsia rose",
      "year": 2001,
      "color": "#C74375",
      "pantone_value": "17-2031"
    },
    {
      "id": 3,
      "name": "true red",
      "year": 2002,
      "color": "#BF1932",
      "pantone_value": "19-1664"
    },
    {
      "id": 4,
      "name": "aqua sky",
      "year": 2003,
      "color": "#7BC4C4",
      "pantone_value": "14-4811"
    },
    {
      "id": 5,
      "name": "tigerlily",
      "year": 2004,
      "color": "#E2583E",
      "pantone_value": "17-1456"
    },
    {
      "id": 6,
      "name": "blue turquoise",
      "year": 2005,
      "color": "#53B0AE",
      "pantone_value": "15-5217"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
    """
@Regression @Smoke
#Second way to use match keyword using negate operatior
 Scenario: To get all the data from the application in JSON format using negate operator
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response !=
    """
    { "page": 11,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 1,
      "name": "cerulean",
      "year": 2000,
      "color": "#98B2D1",
      "pantone_value": "15-4020"
    },
    {
      "id": 2,
      "name": "fuchsia rose",
      "year": 2001,
      "color": "#C74375",
      "pantone_value": "17-2031"
    },
    {
      "id": 3,
      "name": "true red",
      "year": 2002,
      "color": "#BF1932",
      "pantone_value": "19-1664"
    },
    {
      "id": 4,
      "name": "aqua sky",
      "year": 2003,
      "color": "#7BC4C4",
      "pantone_value": "14-4811"
    },
    {
      "id": 5,
      "name": "tigerlily",
      "year": 2004,
      "color": "#E2583E",
      "pantone_value": "17-1456"
    },
    {
      "id": 6,
      "name": "blue turquoise",
      "year": 2005,
      "color": "#53B0AE",
      "pantone_value": "15-5217"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
    """
    
    #Third way to use match keyword for specific property
    @Smoke
    Scenario: To get all the data from the application in JSON format for specific property
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response contains deep {"data":[ {"name": "blue turquoise"}]} 
    And match response contains deep {"text": "To keep ReqRes free, contributions towards server costs are appreciated!" }
    And match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'
   
