require_relative 'item.rb'

class List
    attr_accessor :label
    def initialize(label)
        @label=label
        @items=[]
    end
    def add_item(title, deadline, description=nil)
        if !Item.valid_date?(deadline)
            return false
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end
    def size
        @items.length
    end
    def valid_index?(index)
        return false if index < 0 || index >= @items.length
        return true
    end
    def swap(i1, i2)
        if self.valid_index?(i1) && self.valid_index?(i2)
            @items[i1], @items[i2] =  @items[i2], @items[i1]
            return true
        else
            return false
        end
    end
    def [](index)
        if self.valid_index?(index)
            return @items[index]
        else
            return nil
        end
    end
    def priority
        return @items.first
    end
    def print
        puts "-"*10
        puts @label
        puts '-'*10
        puts 'Index | Item        |Deadline'
        @items.each_with_index do |item,i|
            puts "#{i}      #{item.title}      #{item.deadline}"
        end
    end
    def print_full_item(index)
        if valid_index?(index)
            item=@items[index]
            puts "#{item.title} | #{item.deadline} | #{item.description}"
        end
    end
    def print_priority
        print_full_item(0)
    end
    def up(index,amount)
        if valid_index?(index) and index!=0
            amount ||= 1
            while amount>0
                @items[index-1], @items[index] = @items[index], @items[index-1]
                amount-=1
                index-=1
            end
            return true
        elsif index==0
            return true
        else
            return false
        end
    end
    def down(index,amount)
        if valid_index?(index) and index!=@items.length-1
            amount ||= 1
            while amount>0
                @items[index+1], @items[index] = @items[index], @items[index+1]
                amount-=1
                index+=1
            end
            return true
        elsif index==@items.length-1
            return true
        else
            return false
        end
    end
    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end
end
l = List.new('Groceries')
l.add_item('cheese', '2019-10-25')
l.add_item('toothpaste', '2019-10-25')
l.add_item('shampoo', '2019-10-24')
l.add_item('candy', '2019-10-31')
l.print
l.sort_by_date!
l.print
