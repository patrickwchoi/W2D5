class Flight 
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers=[]
    end
    def full?
        return true if @passengers.length>=@capacity
        return false
    end
    def board_passenger(passenger)
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end
    def list_passengers
        return @passengers.map{|pas|pas.name}
    end
    def [](index)
        return @passengers[index]
    end
    def <<(passenger)
        board_passenger(passenger) #this is exact same as board_passenger method
                                #only add this to make it more syntactically pretty
    end
end