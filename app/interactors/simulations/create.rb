module Simulations
  class Create < ApplicationInteractor
    option :params
    def call
      create_simulation
      expose_simulation
    end

    private

    def create_simulation
      @simulation = Simulation.new(params)
      @simulation.save
    end

    def expose_simulation
      @simulation
    end
  end
end