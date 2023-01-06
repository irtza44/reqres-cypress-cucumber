Feature: Delete User API

Scenario: Verify user is created successfully
When I send "DELETE" request to "https://reqres.in/api/users/1"
And the response status code should be 204
