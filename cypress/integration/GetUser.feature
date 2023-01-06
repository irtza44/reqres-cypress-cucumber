Feature: Get User API


Scenario: Verify request returns JSON
When I send "GET" request to "https://reqres.in/api/users/1"
Then the response should be in JSON

Scenario: Verify the request returns the correct status code
When I send "GET" request to "https://reqres.in/api/users/1"
Then the response status code should be 200

Scenario: Verify the response returns a user object for an existing ID
When I send "GET" request to "https://reqres.in/api/users/1"
Then object in response "body.data" should have property "id"
And object in response "body.data" should have property "email"
And object in response "body.data" should have property "first_name"
And object in response "body.data" should have property "last_name"
And object in response "body.data" should have property "avatar"

Scenario: Verify the response returns not found for a non-existing ID
When I send "GET" request to "https://reqres.in/api/users/999"
Then the response should be in JSON
And the response status code should be 404
