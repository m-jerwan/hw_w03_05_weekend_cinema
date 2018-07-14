require 'pry-byebug'


class Film
  attr_reader :id
  attr_accessor :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO films(title, price) VALUES($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map { |e| Film.new(e)  }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def update
    sql = 'UPDATE films SET(title, price) =($1,$2) WHERE id = $3'
    values = [@title, @price, @id]
    SqlRunner.run(sql,values)
  end

  def customers
    sql = 'SELECT * FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE film_id = $1'
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map {|e| Customer.new(e)}

  end

end
