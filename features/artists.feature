# Created by oleg at 25.04.2018
Feature: REST Artists

  Background: Set base url and headers
    Given I set base URL to "context.staging_url"
    And I set "Accept" header to "application/json"


  @test
  Scenario: Test scenario to get list of artists
    When I make a GET request to "artists"
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"


  @test
  Scenario: Test scenario to create artists
    When I make a POST request to "artists/" with parameters with "image" file
    |gallery_artists|studio  |bplace           |name      |bdate      |article_about |summary     |
    |9              |1       |Ukraine(Uzhgorod)|test name |1987-06-01 |test about    |test summary|
    Then the response status code should equal 201
    And the response status message should equal "Created"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "gallery_artists" should equal 9
    And the response parameter "studio" should equal "1"
    And the response parameter "bplace" should equal "Ukraine(Uzhgorod)"
    And the response parameter "name" should equal "test name"
    And the response parameter "bdate" should equal "1987-06-01"
    And the response parameter "article_about" should equal "test about"
    And the response parameter "summary" should equal "test summary"

  @test
  Scenario: Test scenario to get artists
    When I make a GET request to "artists" by id
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "gallery_artists" should equal 9
    And the response parameter "studio" should equal "1"
    And the response parameter "bplace" should equal "Ukraine(Uzhgorod)"
    And the response parameter "name" should equal "test name"
    And the response parameter "bdate" should equal "1987-06-01"
    And the response parameter "article_about" should equal "test about"
    And the response parameter "summary" should equal "test summary"

  @test
  Scenario: Test scenario to PUT artists
    When I make a PUT request to "artists/" with parameters
    |gallery_artists|bplace             |name         |article_about |summary         |
    |9              |Ukraine(Mukachevo) |test name PUT|test about PUT|test summary PUT|
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "bplace" should equal "Ukraine(Mukachevo)"
    And the response parameter "name" should equal "test name PUT"
    And the response parameter "article_about" should equal "test about PUT"
    And the response parameter "summary" should equal "test summary PUT"

  @test
  Scenario: Test scenario to PATCH artists
    When I make a PATCH request to "artists/" with parameters
    |gallery_artists|bplace             |name           |article_about   |summary           |
    |9              |Ukraine(Lviv)      |test name PATCH|test about PATCH|test summary PATCH|
    Then the response status code should equal 200
    And the response status message should equal "OK"
    And the response header "Content-Type" should equal "application/json"
    And the response parameter "bplace" should equal "Ukraine(Lviv)"
    And the response parameter "name" should equal "test name PATCH"
    And the response parameter "article_about" should equal "test about PATCH"
    And the response parameter "summary" should equal "test summary PATCH"

  @test
  Scenario: Test scenario to delete artists
    When I make a DELETE request to "artists"
    Then the response status code should equal 204
    And the response status message should equal "No Content"