@newsblogs
Feature: Newsblogs
  In order to have newsblogs on my website
  As an administrator
  I want to manage newsblogs

  Background:
    Given I am a logged in refinery user
    And I have no newsblogs

  @newsblogs-list @list
  Scenario: Newsblogs List
   Given I have newsblogs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of newsblogs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @newsblogs-valid @valid
  Scenario: Create Valid Newsblog
    When I go to the list of newsblogs
    And I follow "Add New Newsblog"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 newsblog

  @newsblogs-invalid @invalid
  Scenario: Create Invalid Newsblog (without title)
    When I go to the list of newsblogs
    And I follow "Add New Newsblog"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 newsblogs

  @newsblogs-edit @edit
  Scenario: Edit Existing Newsblog
    Given I have newsblogs titled "A title"
    When I go to the list of newsblogs
    And I follow "Edit this newsblog" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of newsblogs
    And I should not see "A title"

  @newsblogs-duplicate @duplicate
  Scenario: Create Duplicate Newsblog
    Given I only have newsblogs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of newsblogs
    And I follow "Add New Newsblog"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 newsblogs

  @newsblogs-delete @delete
  Scenario: Delete Newsblog
    Given I only have newsblogs titled UniqueTitleOne
    When I go to the list of newsblogs
    And I follow "Remove this newsblog forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 newsblogs
 