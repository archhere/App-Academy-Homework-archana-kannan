require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)

  new_hash = Hash.new(0)
  string.chars.each do |char|
    new_hash[char.downcase] += 1
  end

    result = new_hash.values.count{|num| num.odd?}
    if result > 1
      return false
    else
      return true
    end


    # new_hash = HashMap.new(string.length)
    # string.chars.each do |char|
    #   new_hash[char.downcase] += 1
    # end
    #
    # result = new_hash.values.count{|num| num.odd?}
    #   if result > 1
    #     return false
    #   else
    #     return true
    #   end


end
