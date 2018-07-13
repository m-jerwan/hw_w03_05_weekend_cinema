require 'pry-byebug'


class Film
  attr_accessor :id
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


end
