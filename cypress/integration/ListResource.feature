Feature: List Resource API

Scenario: Verify request returns JSON
When I send "GET" request to "https://reqres.in/api/unknown"
Then the response should be in JSON

Scenario: Verify the request returns the correct status code
When I send "GET" request to "https://reqres.in/api/unknown"
Then the response status code should be 200

Scenario: Verify the request returns 6 items
When I send "GET" request to "https://reqres.in/api/unknown"
Then the "body.data" in response should have length 6

Scenario: Verify the request returns 1st Page
When I send "GET" request to "https://reqres.in/api/unknown"
Then the "body.page" in response should be equal to integer 1

Scenario: Verify the request returns 2nd Page
When I send "GET" request to "https://reqres.in/api/unknown?page=2"
Then the "body.page" in response should be equal to integer 2

Scenario: Verify all resources have correct properties
When I send "GET" request to "https://reqres.in/api/unknown"
Then all objects in response array "body.data" should have property "id"
And all objects in response array "body.data" should have property "name"
And all objects in response array "body.data" should have property "color"
And all objects in response array "body.data" should have property "year"
And all objects in response array "body.data" should have property "pantone_value"

Scenario: Verify response is returned after a delay if delay is specified
When I send "GET" request to "https://reqres.in/api/unknown?delay=5"
Then the response should be in JSON
And the response status code should be 200
And response duration should be greater than 5000 milliseconds
And all objects in response array "body.data" should have property "id"
And all objects in response array "body.data" should have property "name"
And all objects in response array "body.data" should have property "color"
And all objects in response array "body.data" should have property "year"
And all objects in response array "body.data" should have property "pantone_value"


