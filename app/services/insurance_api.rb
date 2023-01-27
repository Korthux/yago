class InsuranceApi
  Error = Class.new(StandardError)

  def get_quote(simulation_id, advice_helper, nace_bel_codes)
    simulation = Simulation.find(simulation_id)
    request = Typhoeus::Request.new(
      "https://staging-gtw.seraphin.be/quotes/professional-liability",
      headers: {'X-Api-Key'=> Rails.application.credentials[:api_key], 'Content-Type'=> "application/json"},
      method: :post,
      body: {
        "annualRevenue": simulation.annual_revenue,
        "enterpriseNumber": simulation.enterprise_number,
        "legalName": simulation.legal_name,
        "naturalPerson": simulation.natural_person,
        "nacebelCodes": nace_bel_codes,
        "deductibleFormula": advice_helper.deductible_formula,
        "coverageCeilingFormula": advice_helper.coverage_ceiling_formula
      }.to_json
    )
    request.run

    response = JSON.parse(request.response.body)
    raise Error.new("Failure when calling insurance api") if response["success"] == false

    response
  end
end