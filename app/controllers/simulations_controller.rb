class SimulationsController < ApplicationController

  def new
    @simulation = Simulation.new
  end

  def create
    interactor = ::Simulations::Create.new(params: simulation_params.to_h)
    simulation = interactor.call
    if simulation.save
      redirect_to :action => "show", :id => simulation.id
    else
      render :new
    end
  end

  def show
    @simulation = Simulation.find(params[:id])
    interactor = ::CoverPropositions::Create.new(simulation: @simulation)
    @result = interactor.call
  end

  def send_email
    SimulationMailer.with(@simulation).send_simulation_email.deliver_now
  end

  private

  def simulation_params
    params.require(:simulation).permit(:profession,
                                       :annual_revenue,
                                       :enterprise_number,
                                       :legal_name,
                                       :natural_person,
                                       :email,
                                       :phone_number,
                                       :address,
                                       :first_name,
                                       :last_name)
  end



end