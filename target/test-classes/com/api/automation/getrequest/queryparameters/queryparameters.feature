@smoke
Feature: To test the Get end point with Query Parameter
  GET https://reqres.in/api/users?page=2

  Background: Create and Initialize base Url
    Given url 'https://reqres.in'

  Scenario: To get the data using Query Parameter
    # Send the Get request with query param
    Given path '/api/users'
    And params page = '2'
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And match header Connection == 'keep-alive'
    
   @Regression
    Scenario: To get the data using Query Parameter with JobId not in the application
    # Create the Job Entry
    # Get the newly created Job Entry using Query Param
    * def createJob = call read("../../CreateUser.feature") { _url:'https://reqres.in', _path:'/api/users',_request:'{"name": "mark", "job": "leader" }' }
    # Send the Get request with query param
    Given path '/api/users'
     And params page = '1'
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And match header Connection == 'keep-alive'
    And print createJob