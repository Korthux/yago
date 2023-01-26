class InsuranceApi

  def get_quote(params)
    request = Typhoeus::Request.new(
      "https://staging-gtw.seraphin.be/quotes/professional-liability",
      headers: {'X-Api-Key'=> Rails.application.credentials[:api_key], 'Content-Type'=> "application/json"},
      method: :post,
      body: params.to_json
    )
    request.run
    @response = JSON.parse(request.response.body)
  end
end