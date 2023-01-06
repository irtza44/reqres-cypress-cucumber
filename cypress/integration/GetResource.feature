Feature: Get Resource API


Scenario: Verify request returns JSON
When I send "GET" request to "https://reqres.in/api/unknown/1"
Then the response should be in JSON

Scenario: Verify the request returns the correct status code
When I send "GET" request to "https://reqres.in/api/unknown/1"
Then the response status code should be 200

Scenario: Verify the response returns a user object for an existing ID
When I send "GET" request to "https://reqres.in/api/unknown/1"
Then object in response "body.data" should have property "id"
And object in response "body.data" should have property "name"
And object in response "body.data" should have property "year"
And object in response "body.data" should have property "color"
And object in response "body.data" should have property "pantone_value"

Scenario: Verify the response returns not found for a non-existing ID
When I send "GET" request to "https://reqres.in/api/unknown/999"
Then the response should be in JSON
And the response status code should be 404
