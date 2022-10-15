require_relative 'item.rb' #dif between require and require_relative?
require_relative 'list.rb'

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args)
        when 'down'
            @list.down(*args)
        when 'swap'
            @list.swap(*args)
        when 'sort'
            @list.sort_by_date!(*args)
        when 'priority'
            @list.priority
        when 'print'
            @list.print #gotta add the arguments if index is provided
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
    end
end
