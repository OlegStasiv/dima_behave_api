# Created by oleg at 25.04.2018
Feature: REST Artcollections

  Background: Set base url and headers
    Given I set base URL to "context.staging_url"
    And I set "Accept" header to "application/json"


  @test
  Scenario: Test scenario to get list of artcollections
    When I make a GET request to "artcollections"
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"


  @test
  Scenario: Test scenario to create artcollection
    When I make a POST request to "artcollections/" with parameters
    |name|description|typeof|
    |test|test description|company|
    Then the response status code should equal 201
    And the response status message should equal "Created"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "name" should equal "test"
    And the response parameter "description" should equal "test description"
    And the response parameter "typeof" should equal "company"

  @test
  Scenario: Test scenario to get artcollection
    When I make a GET request to "artcollections" by id
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "name" should equal "test"
    And the response parameter "description" should equal "test description"
    And the response parameter "typeof" should equal "company"

  @test
  Scenario: Test scenario to put artcollection
    When I make a PUT request to "artcollections/" with parameters
    |name|description|typeof|
    |test PUT|test description PUT|company|
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "name" should equal "test PUT"
    And the response parameter "description" should equal "test description PUT"
    And the response parameter "typeof" should equal "company"

  @test
  Scenario: Test scenario to put artcollection
    When I make a PATCH request to "artcollections/" with parameters
    |name|description|typeof|
    |test PATCH|test description PATCH|company|
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "name" should equal "test PATCH"
    And the response parameter "description" should equal "test description PATCH"
    And the response parameter "typeof" should equal "company"

  @test
  Scenario: Test scenario to delete artcollection
    When I make a DELETE request to "artcollections"
    Then the response status code should equal 204
    And the response status message should equal "No Content"