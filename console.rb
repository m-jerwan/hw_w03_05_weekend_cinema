require_relative('model/customer')
require_relative('model/ticket')
require_relative('model/film')
require 'pry-byebug'

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


ticket_01 = Ticket.new({
  'customer_id' => customer_01.id,
  'film_id' => film_01.id
  })

 ticket_01.save




# p Customer.all
# p Film.all
p Ticket.all

 # binding.pry
 # nil
