Feature: To test the updation of Job entry in the test application
  Test the end point PUT 
  
  Background: Create and Initialize base Url
    Given url 'https://reqres.in'

  Scenario: To update the User Entry for exiting users in JSON format
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/api/users'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"name": "morpheus", "job": "leader" }
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    
    # PUT request
    Given path '/api/users/2'
    And request
      """
      {"name": "morpheus", 
      "job": "manager" 
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    #* assert projectArray[0].length == 3

  Scenario: To update the Job Entry for non-exiting job in JSON format - It should be fail(Negative Scanario)
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
   Given path '/api/users'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"name": "morpheus", "job": "leader" }
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/api/users/2'
    And request
      """
      {"name": "1234", 
       "job" : "leader" 
      }
      
     """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 404

Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file
    # <Gherkin keyword> <call> <read(<location of file>)>
    Given call read("../CreateUser.feature")
    # PUT request
    Given path '/api/users/2'
    And request
      """
      {"name": "mark", 
      "job": "manager" 
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    
  