
class ScreeningLine

    def initialize(options)
        @id = options['id'] if options['id']
        @time = options['time']
        @title = options['title'] 
    end

end