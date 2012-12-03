Feature: Showing suggested contacts

  In order to increase the number of contacts in my network
  As an extrovert who enjoys feeling popular
  I want to see contacts in Rolodecks who I might know but am not yet connected to

  Scenario: Contacts with connections in common should be suggested to each other
    Given I am connected to Joe
    And Dana is connected to Joe
    When I go to the Suggested Contacts page
    Then I see Dana in the list

  Scenario: Suggested contacts through a contact are ordered by being in the Inner Circle
    Given Joe is in my Inner Circle
    And Dana is in Joe's Inner Circle
    And Chris is connected to Joe
    When I go to the Suggested Contacts page
    Then I see Dana at the top of the list
    And I see Chris at the bottom of the list

  Scenario: Contacts who are not connected through any of my connections are not suggested
    Given Tom is connected to Jerry
    And I am not connected to Tom or Jerry
    When I go to the Suggested Contacts page
    Then I do not see Tom or Jerry in the suggested users list
