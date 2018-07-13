require_relative('model/customer')
require_relative('model/ticket')
require_relative('model/film')
# require("pry/buybug")

film_01 = Film.new({
  'title' => 'Inglorious Basterds',
  'price' => '10'
})
film_02 = Film.new({
  'title' => 'Pulp Fiction',
  'price' => '8'
})

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

ticket_01 = Ticket.new({
  'customer_id' => customer_01.id,
  'film.id' => film_01.id
  })


p film_01
p film_02

p customer_01
p customer_02
p customer_03

p ticket_01 #IDs not coming back as no SAVE method yet
