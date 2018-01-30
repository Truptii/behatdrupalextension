@api
  Feature: To test api

    Scenario: To verify if admin can create a content
      Given I am logged in as a user with the "Administrator" role
      When I am viewing an "article" content with the title "My Article"
      Then I should see the heading "My Article"

    Scenario: I try to run the cron
      Given I am logged in as a user with the "Administrator" role
      When I run cron
      And I am on "/admin/reports/dblog"
      Then I should see the link "Cron run completed"

    Scenario: Create many nodes:
      Given "page" content:
      | title    |
      | Page one |
      | Page two |
      And "article" content:
      | title         |
      | First article  |
      | Second article |
      And I am logged in as a user with the "Administrator" role
      When I go to "admin/content"
      Then I should see "Page One"
      And I should see "Page two"
      And I should see "First article"
      And I should see "Second article"

    Scenario: Create nodes with fields
      Given "article" content:
      |title                      |promote  |  body           |
      |First article with fields  |    1    |Placeholder body |
      When I am on the homepage
      And follow "First article with fields"
      Then I should see the text "Placeholder body"

    Scenario: Create and view nodes with fields
      Given I am viewing an "article" content:
      | title   | My article with fields   |
      | body    | A placeholder            |
      Then I should see the heading "My article with fields"
      And I should see the text "A placeholder"

    Scenario: Create users
      Given users:
      |name    | mail            | status|
      |Joe user| joe@example.com | 1     |
      And I am logged in as a user with the "Administrator" role
      When I visit "admin/people"
      Then I should see the link "Joe user"

    Scenario: Login as a user created during this scenario
      Given users:
      |name      | status|
      |Test user | 1     |
      |Dev user  | 1     |
      When I am logged in as "Test user"
      Then I should see the link "Log out"
      When I am logged in as "Dev user"
      Then I should see the link "Log out"

    Scenario: Create a term
      Given I am logged in as a user with the "Administrator" role
      When I am viewing a "tags" term with the name "My tag"
      Then I should see the heading "My tag"

    Scenario: Create many terms
      Given "tags" terms:
      | name   |
      |Tag one |
      |Tag two |
      And I am logged in as a user with the "Administrator" role
      When I go to "admin/structure/taxonomy/tags"
      Then I should see "Tag one "
      And I should see "Tag two "

    Scenario: Create nodes with specific authorship
      Given users:
      |name     |mail            |status  |
      |Joe User|test@example.com|1       |
      And "article" content:
      |title         |author    |body            |placeholder  |
      |Article by Joe|Joe user  |placeholder body|1            |
      When I am logged in as a user with the "Administrator" role
      And I am on the homepage
      And I follow "Article by Joe"
      Then I should see the link "Joe User"

    Scenario: Create an article with multiple team references
      Given "tags" terms:
      | name    |
      | Tag one |
      |Tag two  |
      |Tag three|
      |Tag Four |
      And "article" content:
      |title | body |promote | field_tags|









