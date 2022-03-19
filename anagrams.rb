# g [g]
# gi [gi, ig]
# giz [giz,gzi,zgi,igz,izg,zig]
def permutations(char_arr)
    return char_arr if char_arr.length <= 1
    arr = permutations(char_arr[1..-1])
    #arr [izmo,...]
    result = []
    #word[0...i] + char_array[0] + arr[i..-1]
    arr.each do |word|
        (0..word.length).each do |i|
            result << (word[0...i] + char_arr[0] + word[i..-1])
        end
    end
    result
end

# Anagrams(str1, str2) with str1.length == n, str2.length == m

# Brute Force
# O(m*n!)
# Find and store all anagrams of first in arr
# check if second str is included
def first_anagram?(str1,str2) 
    perms = permutations(str1.chars)
    return perms.include?(str2)
end
# p first_anagram?("gizmo","sally")
# p first_anagram?("elvis", "lives")    #=> true

=begin
Improved Method O
For each letter in the first string, find the index of 
that letter in the second string, and delete at that index

Big Oh: 
O(n*m)
.index function takes O(m) worst case
we run .index n times O(n)
=end
def second_anagram?(str1,str2)
    return false unless str1.length == str2.length
    str1.each_char do |char|
        loc = str2.index(char)
        return false if loc.nil?
        str2.slice!(loc)
    end
    return true if str2.length == 0
    false
end 
# p second_anagram?("gizmo","sally")
# p second_anagram?("elvis", "lives")    #=> true

=begin
Improved greatly method
Sorts both string alphabetically then return true if the strings are identical
running quicksort  

Big Oh: 
O(nlogn+mlogm) for the most part by picking random pivot in quicksort
worst case: O(n^2 + m^2)
.index function takes O(m) worst case
we run .index n times O(n)
=end

def quicksort(str_arr)
    return str_arr if str_arr.length < 2
    pivot_index = rand(0...str_arr.length)
    pivot = str_arr[pivot_index]
    left = []
    right = []
    str_arr.each_with_index do |val,i|
        next if i == pivot_index
        if val < pivot
            left << val
        else
            right << val
        end
    end
    p quicksort(left) + [pivot] + quicksort(right)
    return quicksort(left) + [pivot] + quicksort(right)
end

def third_anagram?(str1,str2)
    quicksort(str1.chars) == quicksort(str2.chars)
end 
# p third_anagram?("gizmo","sally")
# p third_anagram?("elvis", "lives")    #=> true

# Optimal algorithm O(n)
# Add the character count to hash, check to see if second str's characters
# match the hash count
def fourth_anagram?(str1,str2)
    hash = Hash.new(0)
    str1.chars.each do |char|
        hash[char]+=1
    end
    str2.chars.each do |char|
        return false if hash[char] == 0
        hash[char] -= 1
    end
    hash.values.none? {|val| val != 0}
end

p fourth_anagram?("gizmo","sally")
p fourth_anagram?("elvis", "lives")    #=> true