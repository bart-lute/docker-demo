Feature: Login as admin and see if we can logout

  Scenario: login and logout with user admin
    Given I am on "/login"
    When I fill in "_username" with "Foo"
    When I fill in "_password" with "Bar"
    When I press "_submit"
    Then I should be on "/profile"