# README
* Documentation

![yago_diagram2 drawio](https://user-images.githubusercontent.com/56258172/214844537-8cf322af-e088-4ab2-b721-b0c76f008116.png)

1. The infos of the form are send to the simulation controller.
2. The action call the the simulation creation interactor where logic is to create the simulation active record.
3. The simulation controller call the covers proposition interactor to remove logic from controller.
4. The interactor call the profession advice helper to receive infos depending of the profession.
5. The interactor call the insurance via API with Typhoeus.
6. When the user click on the button, the controller is called to send an email via the mailer with sendgrip which is a SMTP service.
