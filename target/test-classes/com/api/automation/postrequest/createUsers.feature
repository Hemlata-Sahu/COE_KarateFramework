Feature: To validate the Post endpoint
  To validate the POST endpoint response

  Background: set up the base url
    Given url 'https://reqres.in'

  Scenario: To create users in JSON format
    Given path '/api/users'
    And request {"name": "morpheus", "job": "leader" }
    And header Accept = 'application/json'
    When method post
    Then status 201
    And print response
    And match response.name == "morpheus"

  Scenario: To create users in xml request body format
    Given path '/api/users'
    And request <users><name>morpheus</name><job>leader</job></users>
    And header Accept = 'application/json'
    When method post
    Then status 201
    And print response

  #Using external file for creating users
  Scenario: To create users in JSON format
    Given path '/api/users'
    * def body = read("data/createUser.json")
    And request body 
    And header Accept = 'application/json'
    When method post
    Then status 201
    And print response
    And match response.name == "morpheus"

  Scenario: To create users in xml request body format
    Given path '/api/users'
    * def body = read("data/createUser.xml")
    And request body
    And header Accept = 'application/json'
    When method post
    Then status 201
    And print response
    #And match response contains deep { "id" }
    
    Scenario: To create users in JSON format with embeded expression 
    Given path '/api/users'
    And request {"name": "morpheus", "job": "leader" }
    # *def getJobID = function() { return Math.floor((100) * Math.random());
    # And request {"jobID": '#(getJobID())' "name": "morpheus", "job": "leader" }  here we are reading value of jobId in runtime
    And header Accept = 'application/json'
    When method post
    Then status 201
    And print response
    And match response.name == "morpheus"
