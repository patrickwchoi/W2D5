class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end
    def has_flight?(flight_num)
        return true if @flight_numbers.include?(flight_num.upcase)
        return false
    end
    def add_flight(flight_num)
        if !self.has_flight?(flight_num)
            @flight_numbers << flight_num.upcase
        end
    end
end