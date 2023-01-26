require 'rails_helper'

RSpec.describe ::Simulations::Create do
  describe "#call" do
    context "happy path" do
      subject { described_class.new(params: params)}
      it "create a simulation with the simulation parameters" do
        expect{
          subject.call
        }.to change {Simulation.count}.by(1)
      end
    end

    context "with erros" do
      subject { described_class.new(params: wrong_params)}
      it "doesn't create simulation if required parameters are not specified" do
        expect{
          subject.call
        }.to change {Simulation.count}.by(0)
      end
    end


    let(:wrong_params) do {
      profession: "Doctors",
      annual_revenue: 60000,
      enterprise_number: "123Test"
    }
    end

    let(:params) do {
      profession: "Doctors",
      annual_revenue: 60000,
      enterprise_number: "123Test",
      legal_name: "doc",
      natural_person: true,
      email: "test@example.com",
      phone_number: "476343221",
      address: "rue jean 12",
      first_name: "Jean",
      last_name: "Foo"
    }
    end

  end
end