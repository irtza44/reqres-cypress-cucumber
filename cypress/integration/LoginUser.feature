Feature: Login User API

Scenario: Verify user is logged in successfully
When I send "POST" request to "https://reqres.in/api/login" with body:
"""
{
    "email": "eve.holt@reqres.in",
    "password": "pistol"
}
"""
Then the response should be in JSON
And the response status code should be 200
And object in response "body" should have property "token"


Scenario: Verify user login fails when password is missing
When I send "POST" request to "https://reqres.in/api/login" with body:
"""
{
    "email": "eve.holt@reqres.in"
}
"""
Then the response should be in JSON
And the response status code should be 400
And property "body.error" in response should be equal to "Missing password"
