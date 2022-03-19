require_relative 'queue'
def windowed_max_range(arr,window_size)
    # current_max_range = nil
    # (0..arr.length-window_size).each do |i|
    #     min = arr[i...i+window_size].min
    #     max = arr[i...i+window_size].max
    #     current_max_range = max-min if current_max_range.nil?
    #     current_max_range = [max-min,current_max_range].max
    # end
    # current_max_range

    # Using MinMaxStackQueue
    
    que = MinMaxStackQueue.new

    (0...window_size).each do |i|
        que.enqueue(arr[i])
    end
    max_range = que.max-que.min
    (window_size...arr.length).each do |i|
        que.enqueue(arr[i])
        que.dequeue
        max_range = [que.max-que.min,max_range].max
    end
    max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
