require 'pry-byebug'

class Ticket
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
    p customer = Ticket.findcustomer(@customer_id)

  end

  def save()
    sql = 'INSERT INTO tickets(customer_id, film_id) VALUES ($1, $2) RETURNING id'
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end
  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return result = tickets.map { |e| Ticket.new(e) }
  end

  def update
    sql = 'UPDATE tickets SET(customer_id, film_id) =($1,$2) WHERE id = $3'
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.findcustomer(id)
    sql = 'SELECT * FROM customers
    WHERE id = $1'
    values = [id]
    customers = SqlRunner.run(sql, values).first
    return customers
  end

  def self.findfilm(id)
    sql = 'SELECT * FROM films WHERE id = $1'
    values = [id]
    films = SqlRunner.run

  end

end
