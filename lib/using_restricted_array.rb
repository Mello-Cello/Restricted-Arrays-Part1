require_relative "restricted_array.rb"
require "pry"
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# NOTES----
# TIME COMPLEXITY: Linear or O(n), where n is the number of items in the array or the length of the input array. The big O indicates we're considering the worst case scenario of how long the algorithm will take to complete the task.
# IMPORTANT NOTE:
# Constant O(1); (ignore, time it takes to run is fixed)
# Linear (add complexity together)
# (n*20) when 20 is a constant set in the loop --> if there's a constant, drop the constant and say that the time complexity is O(n).)
# Quadratic (multiply when loops are nested inside of one another; O(n*n) or O(n^3))

# SPACE COMPLEXITY:
# Contant: O(1)
# Linear: O(n) <-- amount of space taken to loop through something takes the same amount of space (i takes 2 bytes to hold the counter, max (variable) takes 2 bites to hold the current max value, etc.)
# Quadratic: O(n*m) duel btwn jedis (m) and siths (n), a winner is determined
# -----

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) where n is the number of values in the array
# Space complexity: O(1) constant because i always takes up the same amount of space; the method is not dependant upon the length of the

def length(array)
  i = 0
  until array[i] == nil
    # also valid --> while array[i] != nil
    i += 1
  end
  return i
end

# Prints each integer value in the array
# Time complexity: O(n) where n is the number of values in the array
# Space complexity: O(1)
def print_array(array)
  length = length(array)
  i = 0
  while i < length
    print array[i]
    print " "
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) where n is the length of the array
# Space complexity: O(1)
def search(array, length, value_to_find)
  length.times do |i|
    return true if array[i] == value_to_find
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) where n is the length of the array
# Space complexity: O(1)
def find_largest(array, length)
  largest_value = array[0]
  i = 0
  length.times do |item|
    (largest_value = array[i]) if (array[i] > largest_value)
    i += 1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) where n is the length of the array
# Space complexity: O(1)
def find_smallest(array, length)
  smallest_value = array[0]
  i = 0
  length.times do
    (smallest_value = array[i]) if (array[i] < smallest_value)
    i += 1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
# Time complexity: O(n) where n is the length of the array
# Space complexity: O(1)
def reverse(array, length)
  i = 0
  j = length - 1

  until i == (length / 2)
    int_temp = array[i]
    array[i] = array[j]
    array[j] = int_temp

    i += 1
    j -= 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log(n)) where n is the length of the array
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  # raise NotImplementedError
  return array[0] if length == 1
  low = 0
  high = length - 1

  until low == high || low + 1 == high
    mid = (low + high) / 2
    return true if value_to_find == array[mid]
    if value_to_find < array[mid]
      high = mid
    else
      low = mid
    end
  end

  return array[low] == value_to_find || array[high] == value_to_find ? true : false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index + 1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
    # return array
  end
end

## --- END OF METHODS ---
