
class Film
  attr_accessor :id
    def initialize(options)
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @price = options['price']
    end
end
