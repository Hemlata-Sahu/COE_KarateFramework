Feature: To test the updation of Job entry in the test application
  Test the end point PUT /normal/webapi/update

  Background: Create and Initialize base Url
    Given url 'https://reqres.in'

  Scenario: To update the User Entry for exiting users in JSON format
    # Create a new Job Entry
    
    Given path '/api/users'
    And request {"name": "mark", "job": "leader" }
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201