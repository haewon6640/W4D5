require 'set'

def bad_two_sum?(arr,target_sum)
    sums = []
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            sums << arr[i]+arr[j]
        end
    end
    sums.include?(target_sum)
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def merge(arr1,arr2)
    result = []
    while arr1.length > 0 && arr2.length > 0
        result << (arr1[0] < arr2[0] ? arr1.shift : arr2.shift)
    end
    result + arr1 + arr2
end

def mergesort(arr)
    return arr if arr.length < 2
    mid = arr.length/2
    merge(mergesort(arr[0...mid]),mergesort(arr[mid..-1]))
end

def bsearch?(arr,target_num)
    return false if arr.length == 0
    mid = arr.length/2
    return true if arr[mid] == target_num
    if arr[mid] < target_num
        return bsearch?(arr[mid+1..-1],target_num)
    else
        return bsearch?(arr[0...mid],target_num)
    end
end
# sort and run binary search for each ele
# mergesort worst cast = O(nlogn)
# bsearch on each index worst case O(nlogn)
# O(nlogn) + O(nlogn) = O(N*log(N))
def okay_two_sum?(arr,target_sum)
    sorted_arr = mergesort(arr)
    # run binary search for each element to see if target_sum can match
    sorted_arr.each_with_index do |val,i|
        return true if bsearch?(sorted_arr[0...i] + sorted_arr[i+1..-1], target_sum-val)
    end
    false
end

# arr = [0, 1, 5, 7].shuffle
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr,target_sum)
    set = Set.new()
    arr.each do |val|
        return true if set.include?(val)
        set.add(target_sum-val)
    end
    false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

def four_sum?(arr, target_sum)
    
end

