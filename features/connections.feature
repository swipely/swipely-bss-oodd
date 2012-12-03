Feature: Connecting to another contact

  In order to personalize my contacts list
  As a well connected individual
  I want to connect to other contacts

  Scenario: Connecting to another contact
    Given There is a contact record for Fred
    And We are not connected
    When I go to the contacts page
    And I click the Connect button next to Fred's name
    Then The button changes to the text "Connected"

  Scenario: Viewing my connections
    Given There is a contact record for Fred
    And We are connected
    When I go to the My Connections page
    Then I see Fred listed among my connections
