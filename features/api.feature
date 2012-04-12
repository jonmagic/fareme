Feature: hubot can request fares

  Scenario: hubot requests fares from api
    When hubot requests fares for "sbn to vrn may 15 to may 20"
    Then hubot should get a successful response
    And hubot should receive an array of fares
    When hubot grabs fare number "1"
    Then hubot should see "$1421" under "price"