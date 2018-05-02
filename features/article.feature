# Created by oleg at 25.04.2018
Feature: REST Article

  Background: Set base url and headers
    Given I set base URL to "context.staging_url"
    And I set "Accept" header to "application/json"


  @test
  Scenario: Test scenario to get list of article
    When I make a GET request to "article"
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"


  @test
  Scenario: Test scenario to create article
    When I make a POST request to "article/" with parameters with "image" file
    |tag |magazine|view_counter|name     |author_name|author_title|summary     |date      |title     |
    |test|1       |3           |test name|Dima       |Dima test   |test summary|2018-01-01|test title|
    Then the response status code should equal 201
    And the response status message should equal "Created"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "tag" should equal "test"
    And the response parameter "magazine" should equal 1
    And the response parameter "view_counter" should equal 3
    And the response parameter "name" should equal "test name"
    And the response parameter "author_name" should equal "Dima"
    And the response parameter "author_title" should equal "Dima test"
    And the response parameter "summary" should equal "test summary"
    And the response parameter "title" should equal "test title"

  @test
  Scenario: Test scenario to get article
    When I make a GET request to "article" by id
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "tag" should equal "test"
    And the response parameter "magazine" should equal 1
    And the response parameter "view_counter" should equal 3
    And the response parameter "name" should equal "test name"
    And the response parameter "author_name" should equal "Dima"
    And the response parameter "author_title" should equal "Dima test"
    And the response parameter "summary" should equal "test summary"
    And the response parameter "title" should equal "test title"

  @test
  Scenario: Test scenario to PUT article
    When I make a PUT request to "article/" with parameters
    |tag         |name                |author_name|
    |test tag PUT|Igor                |Ivan       |
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "tag" should equal "test tag PUT"
    And the response parameter "name" should equal "Igor"
    And the response parameter "author_name" should equal "Ivan"

  @test
  Scenario: Test scenario to PATCH article
    When I make a PATCH request to "article/" with parameters
    |tag           |name                |author_name|
    |test tag PATCH|Igor                |Ivan       |
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "tag" should equal "test tag PATCH"
    And the response parameter "name" should equal "Igor"
    And the response parameter "author_name" should equal "Ivan"

  @test
  Scenario: Test scenario to delete artcollection
    When I make a DELETE request to "article"
    Then the response status code should equal 204
    And the response status message should equal "No Content"