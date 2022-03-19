class MyQueue
    def initialize
        @store = []
    end
    def peek
        @store[0]
    end
    def size
        @store.length
    end
    def empty?
        @store.empty?
    end
    def enqueue(ele)
        @store.push(ele)
    end
    def dequeue(ele)
        @store.shift
    end
end

class MinMaxStack

    def initialize
        @store = []
        @curr_max = []
        @curr_min = []
    end
    def peek
        @store[-1]
    end
    def size
        @store.length
    end
    def pop
        @curr_max.pop
        @curr_min.pop
        @store.pop
    end
    def push(ele)
        @store.push(ele)
        @curr_max.push([max,ele].max)
        @curr_min.push([min,ele].min)
    end
    def max
        @curr_max.empty? ? -100000 : @curr_max[-1]
    end
    def min
        @curr_min.empty? ? 100000 : @curr_min[-1]
    end
    def show
        @store.map.with_index {|val,i| [val, "max: #{@curr_max[i]}, min: #{@curr_min[i]}"]}
    end
    def empty?
        @store.empty?
    end
end
=begin
3 3
3,4    4,3
3,4,5  5,4,3
=end
class MinMaxStackQueue
    def initialize
        @store = MinMaxStack.new
        @reverse_store = MinMaxStack.new
    end

    def size
        @store.length + @reverse_store.length
    end

    def empty?
        @store.empty? && @reverse_store.empty?
    end

    def enqueue(ele)
        @store.push(ele)
    end
    
    def dequeue
        fill_reverse if @reverse_store.empty?
        @reverse_store.pop
    end

    def max 
        fill_reverse if @reverse_store.empty?
        [@reverse_store.max,@store.max].max
    end
    def min 
        fill_reverse if @reverse_store.empty?
        [@reverse_store.min,@store.min].min
    end
    def fill_reverse 
        until @store.empty?
            @reverse_store.push(@store.pop)
        end
    end
    def show
        @store.show
    end
end
