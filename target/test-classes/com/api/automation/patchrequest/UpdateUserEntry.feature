@Regression
Feature: To test the updation of Job entry in the test application
  Test the end point PUT 
  
  Background: Create and Initialize base Url
    Given url 'https://reqres.in'

  Scenario: To update the User Entry for exiting users in JSON format
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
   * def createJob = call read("../../CreateUser.feature") { _url:'https://reqres.in', _path:'/api/users',_request:'{"name": "mark", "job": "leader" }' }
    
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
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    #* assert projectArray[0].length == 3

 