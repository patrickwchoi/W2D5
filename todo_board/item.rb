class Item

    def self.valid_date?(date_string)
        parts = date_string.split('-').map(&:to_i)
        year, month, day = parts
        return false if parts.length != 3
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        true    
    end
    attr_accessor :title, :description
    attr_reader :deadline
    def initialize(title, deadline, description)
        @title=title
        if Item.valid_date?(deadline)
            @deadline=deadline
        else 
            raise ArgumentError.new 'invalid date'
        end
        @description=description
    end
    def deadline=(deadline)
        if Item.valid_date?(deadline)
            @deadline=deadline
        else 
            raise ArgumentError.new 'invalid date'
        end
    end

end