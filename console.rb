require_relative('model/customer')
require_relative('model/ticket')
require_relative('model/film')
require_relative('model/screening')
require ('pry-byebug')

Customer.delete_all
Film.delete_all


customer_01 = Customer.new({
  'name' => 'Joanna',
  'funds' => '30'
  })

customer_02 = Customer.new({
  'name' => 'Raphael',
  'funds' => '20'
  })

customer_03 = Customer.new({
  'name' => 'Digory',
  'funds' => '10'
  })

  customer_01.save
  customer_02.save
  customer_03.save

  customer_02.name = 'Rafał'
  customer_02.update
   # p customer_02

film_01 = Film.new({
  'title' => 'Inglorious Basterds',
  'price' => '10'
})
film_02 = Film.new({
  'title' => 'Pulp Fiction',
  'price' => '8'
})


film_01.save
film_02.save

film_02.price = 6
film_02.update

screening_01 = Screening.new ({
  'time' => '18:00',
  'film_id' => film_01.id
})
screening_01.save

screening_02 = Screening.new({
  'time' => '20:00',
  'film_id' => film_02.id
})
screening_02.save

ticket_01 = Ticket.new({
  'customer_id' => customer_01.id,
  'film_id' => film_01.id
  })
ticket_01.save
ticket_01.customer_id = customer_02.id 
ticket_01.update

ticket_02 = Ticket.new({
  'customer_id' => customer_01.id,
  'film_id' => film_01.id
  })
 ticket_02.save

ticket_03 = Ticket.new({
  'customer_id' => customer_02.id,
  'film_id' => film_02.id
  })
 ticket_03.save
  
ticket_04 = Ticket.new({
  'customer_id' => customer_03.id,
  'film_id' => film_02.id
  })
 ticket_04.save

#Show which films a customer has booked to see, 
 customer_02.films
#and see which customers are coming to see one film.
 film_01.customers

 #Buying tickets should decrease the funds of the customer by the price
  # - ticket depretiation is imbeded in ticket initialization
  # which is a bad idea. 

#  Check how many tickets were bought by a customer
  customer_02.films.length
  #                   ---OR----
  customer_02.how_many_tickets_info

  #Check how many customers are going to watch a certain film
  film_01.customers.length

  #Create a screenings table that lets us know what time films are showing
  Screening.show_all