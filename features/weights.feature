Feature: Adding weights to a connection

  In order to more efficiently use my network to make new connections
  As a person who uses a list to rank people I know
  I want to organize my connections by how close I am to them

  Scenario: Categorizing a contact as being in my inner circle
    Given I am connected to Fred
    When I go to the My Connections page
    And I click the Inner Circle button next to Fred
    Then The button next to Fred is replaced with the text "Is in my Inner Circle"

  Scenario: Sorting contacts with those in the Inner Circle at the top
    Given I am connected to Fred
    And Fred is in my Inner Circle
    And Joe is not in my Inner Circle
    When I go to the My Connections page
    And The contact for Fred should be above the contact for Joe
