require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

  customer1 = Customer.new({
    'first_name' => 'John',
    'last_name' => 'Smith',
    'funds' => 30
  })

  customer1.save()

  customer2 = Customer.new({
    'first_name' => 'David',
    'last_name' => 'Johnson',
    'funds' => 20
  })

  customer2.save()

  film1 = Film.new({
    'title' => 'Transporter',
    'price' => 10
  })

  film1.save()

  film2 = Film.new({
    'title' => 'Mechanic',
    'price' => 8
  })

  film2.save()


  ticket1 = Ticket.new({
    'customer_id' => customer1.id,
    'film_id' => film1.id
    })

  ticket2 = Ticket.new({
    'customer_id' => customer2.id,
    'film_id' => film2.id
    })

  ticket1.save()
  ticket2.save()








binding.pry
nil
