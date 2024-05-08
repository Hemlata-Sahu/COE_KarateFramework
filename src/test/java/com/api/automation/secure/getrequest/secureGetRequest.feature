Feature: To access the GET end point which is secure with Basic Auth
GET https://reqres.in/api/users/7

   Background: Set up the base path
    Given url 'https://reqres.in'

  Scenario: To access the GET end point with basic auth
    Given path '/api/users/7'
    And headers {Accept:'application/json', Authorization:'Basic YXV0aG9yOndlbGNvbWU='}
    When method get
    Then status 200
    And match response == '#notnull'

  Scenario: To access the GET end point without basic auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
    And match response == '#notnull'

  Scenario: To access the GET end point with non-exiting user
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YXV0aG9yOndlbGNvbWUx'}
    When method get
    Then status 401

  