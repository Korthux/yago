module Professions
  class Base

    def deductible_formula
      "medium"
    end

    def coverage_ceiling_formula
      "medium"
    end

    def cover
      raise NotImplementedError, "Please implement in a descendant."
    end

  end
end