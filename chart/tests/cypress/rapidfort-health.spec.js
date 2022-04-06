describe('Basic RapidFort', function() {
    it('Check RapidFort is accessible', function() {
        cy.visit(Cypress.env('url'))
    })
  })
  