Feature: Create User API

Scenario: Verify user is created successfully
When I send "POST" request to "https://reqres.in/api/users" with body:
"""
{
    "name": "morpheus",
    "job": "leader"
}
"""
Then the response should be in JSON
And the response status code should be 201
And object in response "body" should have property "id"
And object in response "body" should have property "createdAt"
And property "body.name" in response should be equal to "morpheus"
And property "body.job" in response should be equal to "leader"
