@newevents
Feature: Newevents
  In order to have newevents on my website
  As an administrator
  I want to manage newevents

  Background:
    Given I am a logged in refinery user
    And I have no newevents

  @newevents-list @list
  Scenario: Newevents List
   Given I have newevents titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of newevents
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @newevents-valid @valid
  Scenario: Create Valid Newevent
    When I go to the list of newevents
    And I follow "Add New Newevent"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 newevent

  @newevents-invalid @invalid
  Scenario: Create Invalid Newevent (without title)
    When I go to the list of newevents
    And I follow "Add New Newevent"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 newevents

  @newevents-edit @edit
  Scenario: Edit Existing Newevent
    Given I have newevents titled "A title"
    When I go to the list of newevents
    And I follow "Edit this newevent" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of newevents
    And I should not see "A title"

  @newevents-duplicate @duplicate
  Scenario: Create Duplicate Newevent
    Given I only have newevents titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of newevents
    And I follow "Add New Newevent"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 newevents

  @newevents-delete @delete
  Scenario: Delete Newevent
    Given I only have newevents titled UniqueTitleOne
    When I go to the list of newevents
    And I follow "Remove this newevent forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 newevents
 