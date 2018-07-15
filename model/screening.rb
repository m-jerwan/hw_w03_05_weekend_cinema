require ('pry-byebug')
require_relative('screening_line')


class Screening

def initialize(options)
    @id = options['id'] if options['id']
    @time = options['time']
    @film_id = options['film_id'] 
end

def save
    sql = "INSERT INTO screenings(time, film_id) VALUES($1, $2) RETURNING id"
    values = [@time, @film_id]
    screening = SqlRunner.run(sql, values).first 
    return screening
end

def self.show(film_id)
    sql = "SELECT * FROM screenings 
    INNER JOIN films
    ON screenings.film_id = films.id
    WHERE films.id = $1"
    values = [film_id]
    screenings = SqlRunner.run(sql, values)
    result = screenings.map{|e| ScreeningLine.new(e)}
    return result
end

def self.show_all
    sql = "SELECT * FROM screenings INNER JOIN films ON screenings.film_id = films.id"
    screenings = SqlRunner.run(sql)
    result = screenings.map{|e| ScreeningLine.new(e)}
    return result
end

end
