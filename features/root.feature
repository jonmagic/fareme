Feature: Anyone can visit "/"

  Scenario: I visit "/"
    When I go to the home page
    Then I should see "Fare Me"
    And I should see "@jonmagic might know more"