class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |num,idx|
      sum += (num * idx).hash
    end
    sum.hash
  end
end

class String
  def hash
    integer_version = self.chars.map{|char| char.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.map{|el| el.to_s}.hash + self.values.map{|el| el.to_s}.hash
  end
end
