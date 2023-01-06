Feature: Update User API

Scenario: Verify user is created successfully
When I send "PUT" request to "https://reqres.in/api/users/1" with body:
"""
{
    "name": "morpheus",
    "job": "zion leader"
}
"""
Then the response should be in JSON
And the response status code should be 200
And object in response "body" should have property "updatedAt"
And property "body.name" in response should be equal to "morpheus"
And property "body.job" in response should be equal to "zion leader"
