Feature: validate the JSON Schema
  To validate the JSON Schema for the POST API

  Background: set up the base url
    Given url 'https://reqres.in'

  Scenario: To create users in JSON format
    Given path '/api/users'
    * def body = read("data/createUser.json")
    And request body
    And header Accept = 'application/json'
    When method post
    Then status 201
    And print response
    And match response ==
      """
      {
      "name": '#string',
      "job": '#string',
      "id": '#string',
      "createdAt": '#string'
      }

      """

  Scenario: Schema validation for Get Endpoint
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get #send the get request
    Then status 200 #the status code response should be 200
    * def dataSchema = { "id": '#number' , "name": '#string', "year": '#number',"color": '#string', "pantone_value": '#string'}
    * def supportSchema = { "url": '#string', "text": '#string'}
    * def mainSchema = { "page": '#number', "per_page": '#number', "total": '#number', "total_pages": '#number', "data": '#[] ##(dataSchema)', "support": '##(supportSchema)' }
    And match response == 
    """ 
    '##(mainSchema)'
    """
    