## Technos
Ruby

Postgresql
## How to run the app ?
Run the following command in the root of the project :
```bash
bin/rails s
```
## Diagram
![Diagramme sans nom drawio-2](https://user-images.githubusercontent.com/56258172/214846697-3139a110-6071-4a07-bab8-46652c931d3f.png)

1. The infos of the form are send to the simulation controller.
2. The action call the the simulation creation interactor where logic is to create the simulation active record.
3. The simulation controller call the covers proposition interactor to remove logic from controller.
4. The interactor call the profession advice helper to receive infos depending of the profession.
5. The interactor call the insurance via API with Typhoeus.
6. When the user click on the button, the controller is called to send an email via the mailer with sendgrip which is a SMTP service.


## Used Libraries

To send emails : [Sendgrid](https://sendgrid.com)

To run HTTP requests : [Typhoeus](https://github.com/typhoeus/typhoeus)

To have more flexible code : [Dry-rb](https://dry-rb.org)

For tests : [Rspec](https://github.com/rspec/rspec-rails/tree/6-0-maintenance)
