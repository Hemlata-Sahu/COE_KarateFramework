Feature: To test the endpoint of the application

  Background: Set up the base path
    Given url 'https://reqres.in'

  Scenario: To get all the data from the application using json path expression
    Given path '/api/users?page=2'
    When method get
    Then status 200
    #karate.jsonPath(doc, jsonPathExpression )
    * def total_pages = karate.jsonPath(response, "$.total_pages")
    And print response
    * def data_name = karate.jsonPath(response, "$[data].[?(@.id== 2)].name")
    #* def support_text = karate.jsonPath(response, "$[support].text")
    And print "Total Pages -->" , total_pages
    #And print "Name -->" , data_name
    #And print "Support Test -->" , support_text
