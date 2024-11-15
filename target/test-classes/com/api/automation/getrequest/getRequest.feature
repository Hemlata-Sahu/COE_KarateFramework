Feature: To test the endpoint of the application

  Background: Set up the base path
    Given url 'https://reqres.in'
    And print '========This is the Background keyword ====================='

  # This is how we can use base url from background (base + path)
  @Smoke
  Scenario: To get all the data from the application in JSON format
    Given path '/api/users?page=2'
    When method get
    Then status 200
   #the status code response should be 200

 
  # Including header to get response in json format
   @Smoke @Regression
  Scenario: To get all the data from the application in JSON format using path variable
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    Then status 200
  #the status code response should be 200

  # Including header to get response in xml format
  @Regression
  Scenario: To get all the data from the application in xml format using path variable
    #Given url 'https://reqres.in'
    Given path '/api/users?page=2'
    And header Accept = 'application/xml*'
    When method get
    Then status 200
  #the status code response should be 200


 # This is using simple url
  # Scenario: To get all the data from the application in JSON format
  # Given url 'https://reqres.in/api/users?page=2'
  # When method get #send the get request
  # Then status 200 #the status code response should be 200

  # This is using additional base+path url
  # Scenario: To get all the data from the application in JSON format using path variable
  # Given url 'https://reqres.in'
  # And path '/api/users?page=2'
  # And header Accept = 'application/json'
  # When method get #send the get request
  # Then status 200 #the status code response should be 200