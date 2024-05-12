Feature: Authentication Utils

  Scenario: Get Auth Token
    * def username = args[0]
    * def password = args[1]
 
    Given url baseUrl
    And path '/auth'
    And form field username = username 
    And form field password = password 
    When method post 
    Then status 200
    * def authToken = response.token
    * print authToken