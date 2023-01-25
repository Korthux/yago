class SimulationMailer < ApplicationMailer
  default from: 'loury.jacob@icloud.com'

  def send_simulation_email
    @simulation = params[:simulation]
    puts(@simulation.first_name)
    @simulation_url = params[:domain_name]+"/simulation?id="+@simulation.id.to_s
    mail(to: @simulation.email, subject: "Votre simulation")
  end
end