Feature: Get booking details

  Background:
    * setAuthToken()


  Scenario: Get list of all bookings present
    * karate.log('################ Test Case Execution started for: ',karate.info.scenarioName, ' #############################')
    Given url baseUrl
    And path path.getAllBookings
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * karate.log('################ Test Case Execution finished for: ',karate.info.scenarioName, ' #############################')

  @getbooking_tc2
  Scenario: Get booking by id
    * karate.log('################ Test Case Execution started for: ',karate.info.scenarioName, ' #############################')
    Given url baseUrl
    And path path.getBooking.replace('{id}',1)
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * karate.log('################ Test Case Execution finished for: ',karate.info.scenarioName, ' #############################')

  Scenario: Get booking by first name and last name
    * karate.log('################ Test Case Execution started for: ',karate.info.scenarioName, ' #############################')
    Given url baseUrl
    And path path.getAllBookings
    And param firstname = 'Jim'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * karate.log('################ Test Case Execution finished for: ',karate.info.scenarioName, ' #############################')

