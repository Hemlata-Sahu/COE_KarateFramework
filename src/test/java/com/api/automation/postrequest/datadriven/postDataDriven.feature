Feature: To create job description in the test application

  Background: Read the data for data driven
    * def testdata = read("testData.csv")

  Scenario Outline: To create job description in the test application <method>
    Given print '<url>'
    Then print '<path>'
    When print '<method>'
    And print '<status>'

    Examples: 
      | url               | path              | method | status |
      | https://reqres.in | /api/users?page=2 | get    |    200 |
      | https://reqres.in | /api/users        | post   |    201 |
      | https://reqres.in | /api/users/7      | get    |    201 |

  Scenario Outline: Data Driven for the job description entry - <jobId> - It should be fail for last entry((Negative Scanario)
    Given url 'https://reqres.in'
    And path '/api/users'
    And request {"name": '#(name)', "job": '#(job)' }
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status <status>

    Examples: 
      | name       | job               |  status |
      |  morpheus  | leader            |     201 |
      | Peter      | Manager           |     201 |
      | 12345      |     123           |     400 |
      
      
    Scenario Outline: Data Driven for the job description entry using csv files - <jobId>
    Given url 'https://reqres.in'
    And path '/api/users'
    And request {"name": '#(name)', "job": '#(job)' }
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status <status>

    Examples: 
      #|testdata|
      | read("testData.csv") |
