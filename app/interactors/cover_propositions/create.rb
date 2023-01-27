module CoverPropositions
  class Create < ApplicationInteractor
    require 'csv'

    option :simulation

    def call
      get_nace_bel_codes
      get_covers
      expose_result
    end

    private

    attr_reader :advice_helper
    attr_reader :nace_bel_codes

    def get_nace_bel_codes
      @nace_bel_codes = []
      CSV.foreach(("public/NACEBEL_2008.csv"), headers: true, col_sep: ";") do |row|
        if row['Label FR']&.downcase.include?("médical".downcase) and row['Level nr'] == "5"
          @nace_bel_codes.push(row['Code'])
        end
      end
    end

    def get_covers
      insurance_api = ::InsuranceApi.new
      @result = insurance_api.get_quote(simulation.id, advice_helper, @nace_bel_codes)

      data = @result["data"]
      @result_covers = {
        "cover_premiums": data["grossPremiums"],
        "coverage_ceiling": data["coverageCeiling"],
        "deductible": data["deductible"],
        "cover_advice": advice_helper.cover
      }

      @result_covers
    rescue StandardError => error
      fail!(error.message)
    end

    def advice_helper
      @advice_helper ||= "::Professions::#{simulation.profession}".safe_constantize.new
    end

    def expose_result
      @result_covers
    end

  end
end