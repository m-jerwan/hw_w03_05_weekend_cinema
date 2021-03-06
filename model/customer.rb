require_relative('../db/sql_runner.rb')
require_relative('ticketInfo.rb')

require 'pry-byebug'

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers(name, funds) VALUES ($1, $2) RETURNING id"
    values  = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end


  def update()
    sql = 'UPDATE customers SET(name, funds) = ($1,$2) WHERE id = $3'
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |e| Customer.new(e)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end


def films
  sql = 'SELECT * FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1'
  values= [@id]
  films = SqlRunner.run(sql, values)
  result = films.map { |e| Film.new(e)}
  return result
end

def how_many_tickets_info
  sql = 'SELECT * FROM tickets WHERE customer_id = $1'
  values =[@id]
  tickets = SqlRunner.run(sql, values)
  result = (tickets.map{|e| TicketInfo.new(e)}).length
  return result
end
end
