module Enumerable
  def my_each_with_index
    return self unless block_given?

    i = 0
    enum_length = self.length
    while i < enum_length
      i += 1
      yield(self[i-1], (i - 1))
    end

    self
  end

  def my_select
    return self unless block_given?

    filtered_array = []
    self.my_each { |element| filtered_array.push(element) if yield(element) }

    if filtered_array
      return filtered_array
    else
      return []
    end

  end
end

class Array
  def my_each
    return self unless block_given?

    i = 0
    array_length = self.length
    while i < array_length
      i += 1
      yield(self[i - 1])
    end

    self
  end
end
