@Regression
Feature: To test the delete end point
  DELETE /normal/webapi/remove/{id}

  Background: Create and Initialize base Url
    Given url 'https://reqres.in'

  @Smoke
  Scenario: To delete the job entry from application using job id
    # Create a new Job entry
    # Delete the newly created job entry
    # Get request with qury parameter and validate for 404
    Given def createJobResponse = call read("../CreateUser.feature") { _url:'https://reqres.in', _path:'/api/users',_request:'{"name": "mark", "job": "leader" }' }
    * def jobId = createJobResponse.id
    # delete request
    Given path '/api/users/'+ jobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 204
    And print jobId
    
    # Get Request
    Given path '/api/users/' + jobId
    And header Accept = 'application/json'
    When method get
    Then status 404
    
    @Regression @Smoke
    Scenario: To delete the job entry from application using job id and delete the job entry twice  --- It should fail
    # Create a new Job entry
    # Delete the newly created job entry
    # Get request with qury parameter and validate for 404
    Given def createJobResponse = call read("../CreateUser.feature") { _url:'https://reqres.in', _path:'/api/users',_request:'{"name": "mark", "job": "leader" }' }
    * def jobId = createJobResponse.id
    # delete request
    Given path '/api/users/'+ jobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 204
    And print jobId
    
    Given path '/api/users/'+ jobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 404
    
    @Smoke
    Scenario: To demo request chaining
    
    # Create a new job entry.
    # Extract the job id and job title from the response of POST request
    # Send the path request, Value of query parameter will be set by , info extracted from previous request
    # Extract the job id and job title from the response of patch request
    # Get request with query parameter, value of query param is set by info extracted from responce of patch request
    # Add the validation on job description in the response of get request
     Given def createJobResponse = call read("../CreateUser.feature") { _url:'https://reqres.in', _path:'/api/users',_request:'{"name": "mark", "job": "leader" }' }
    * def jobId = createJobResponse.id
    * def name = createJobResponse.name
    
     # Patch request
    * def jobDes = 'maneger'
    Given path '/api/users/'+ jobId
    And request
      """
      {"name": '#(name)', 
      "job": '#(jobDes)' 
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method patch
    Then status 200
 