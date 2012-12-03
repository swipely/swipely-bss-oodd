Feature: Identifying my contact

  In order to make it possible to have a personalized contact list
  As a well connected individual
  I want to identify myself as one of the contacts in the database

  Scenario: Identifying myself
    Given I have a contact record
    When I go to the contacts page
    And I click on my name
    And I click login
    Then I see my name in the nav bar
