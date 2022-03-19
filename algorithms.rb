def my_min(list)
    # O(n^2) approach
    # list.each_with_index do |val,i|
    #     return val if list.all? { |val2| val <= val2}
    # end

    # O(n) approach)
    min = list[0] 
    list.each do |val|
        min = [val,min].min
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(list)
    # Brute force O(n^2)
    # subarrays = []
    # (0...list.length).each do |i|
    #     (i...list.length).each do |j|
    #         subarrays << list[i..j]
    #     end
    # end
    # max = subarrays.inject(subarrays[0].sum) do |accum,el| 
    #     [accum,el.sum].max
    # end

    # Improved Method O(n)
    curr_sum = list[0]
    largest_sum = curr_sum
    (1...list.length).each do |i|
        curr_sum = [list[i],curr_sum+list[i]].max
        largest_sum = [curr_sum,largest_sum].max
    end
    largest_sum

    # curr_sum = list[0]
    # largest_sum = curr_sum
    # (1...list.length).each do |i|
    #     if curr_sum < 0
    #         if curr_sum < list[i]
    #             curr_sum = list[i]
    #         end
    #     else
    #         curr_sum += list[i]
    #     end
    #     largest_sum = [curr_sum,largest_sum].max
    # end
    # largest_sum

end

#curr 2 large = 2
#curr 5 large = 5
#curr -1 large = 5
#check 6 vs 7 , set curr = 7 large = 7
#curr = 1 large = 7
#check 8 vs 7 set curr = 8 large = 8

list = [2, 3, -6, 7, -6, 8]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])