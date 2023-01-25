module Professions
  class Doctors < Base
    def deductible_formula
      "small"
    end

    def coverage_ceiling_formula
      "large"
    end

    def cover
      "legalExpenses"
    end
  end
end