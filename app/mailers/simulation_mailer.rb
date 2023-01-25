class SimulationMailer < ApplicationMailer
  default from: 'loury.jacob@icloud.com'

  def send_simulation_email
    @simulation = params[:simulation]
    @simulation_url = request.domain+"/simulation?id="+@simulation.id
    mail(to: @simulation.email, subject: "Votre simulation")
  end
end