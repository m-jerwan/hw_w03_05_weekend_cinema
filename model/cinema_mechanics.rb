require 'pry-byebug'

class CinemaMechanics


def self.selling_ticket(customer_id, film_id)
        #customer is being charged when ticket is created:
    customer = Ticket.findcustomer(customer_id)
    film = Ticket.findfilm(film_id)
    customer['funds'] = (customer['funds'].to_i - film['price'].to_i).to_s
    #customer.update()  #<<<< WHY THIS IS NOT WORKING??
end


end
