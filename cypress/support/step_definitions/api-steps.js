import { Then, When, Given } from "cypress-cucumber-preprocessor/steps";

Then(`I see {string} in the title`, (title) => {
  cy.title().should('include', title)
})


When(`I send {string} request to {string}`, (method, url) => {
    cy.request({method, url, failOnStatusCode: false}).then((response) => {
        cy.wrap(response).as('response')
    })
})

When(`I send {string} request to {string} with body:`, (method, url, body) => {
    cy.request({method, url, body: JSON.parse(body), failOnStatusCode: false}).then((response) => {
        cy.wrap(response).as('response')
    })
})

Then('the response should be in JSON', () => {
    cy.get('@response').its('headers').its('content-type').should('include', 'application/json')
})

Then('the response status code should be {int}', (statusCode) => {
    cy.get('@response').its('status').should('be.equal', statusCode)
})

Then('the {string} in response should have length {int}', (jsonPath, length) => {
    cy.get('@response').its(jsonPath).should('have.length', length)
})

Then('the {string} in response should be equal to integer {int}', (jsonPath, value) => {
    cy.get('@response').its(jsonPath).should('be.equal', value)
})

Then('all objects in response array {string} should have property {string}', (jsonPath, propertyName) => {
    cy.get('@response').its(jsonPath).each((item) => {
        expect(item).to.have.property(propertyName)
    })
})

Then('object in response {string} should have property {string}', (jsonPath, propertyName) => {
    cy.get('@response').its(jsonPath).should('have.property', propertyName)
})

Then('property {string} in response should be equal to {string}', (jsonPath, value) => {
    cy.get('@response').its(jsonPath).should('be.equal', value)
})

Then('response duration should be greater than {int} milliseconds', (responseTime) => {
    cy.get('@response').its('duration').should('be.greaterThan', responseTime)
})
