Feature: To validate the Get endpoint
  To validate the Get endpoint response
  
  Background: set up the base url
  Given url 'https://reqres.in'
  
  #First way to use match keyword using equal operatior
  Scenario: To get all the data from the application in JSON format and validate from file
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    #create a veriable to store the data from external json file
    * def actualResponse = read("../JsonResponse.json")
    And print 'File-->" , actualResponse
    And match response == actualResponse
    
    
    Scenario: To get all the data from the application in JSON format and validate from file
    Given path '/api/users?page=2'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    #create a veriable to store the data from external xml file
    * def actualResponse = read("../XMLResponse.json")
    And print 'File-->" , actualResponse
    And match response == actualResponse
    
    