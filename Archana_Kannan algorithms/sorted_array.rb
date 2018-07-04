# [1,1,2,2,3,3,4,5,5,6,6,7,7]
#
# Given a sorted array with each number repeating twice except for 1 number,
# write a program to return the number that does not repeat

def single_element(arr)
  return false if arr.length == 0
  mid = arr.length/2
  first = arr[mid]
  result = is_unique(arr,mid)
  if result == true
    return arr[mid]
  elsif result == (mid-1)
    single_element(arr[0...mid-1] + arr[mid+1..-1])
  else
    single_element(arr[0...mid] + arr[mid+2..-1])
  end
end


def is_unique(arr,idx)
  if arr[idx-1] == arr[idx]
    return (idx-1)
  elsif arr[idx + 1] == arr[idx]
    return (idx + 1)
  else return true
  end
end


# Write a function that return true if brackets open and close properly.



def well_formed_string(str)
  count = 0
  opened = false
  openbrackt = ["(","[","{"]
  closebracket = [")","]","}"]

  str.each do |bracket|
    if count < 0
      return false
    elsif openbrackt.include?(bracket)
      count += 1
      opened = true
    elsif  closebracket.include?(bracket)
      count -= 1
      opened = false (if count == 0)
    end
  end
  return false if opened
  return true
end


# subsets


def subsets(arr)
  return [[]] if arr == []
  last_val = [arr[-1]]
  prev_val = subsets(arr[0..-2])
  return prev_val + prev_val.map {|el| el + last_val}

end



def longest_palindrome(string)
  i=0
  palindrome = ""
  indices = []
  while  i < string.length
    j = i + 1
    while j < string.length
      temp = string[i..j]
      if temp == temp.reverse && (palindrome == "" || palindrome.length < temp.length)
        palindrome = temp
        indices = [i,j]
      end
      j += 1
    end
    i += 1
  end
  return indices
end
