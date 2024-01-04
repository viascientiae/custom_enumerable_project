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

  def my_all?
    return self unless block_given?

    filtered_array = []
    self.my_each { |element| filtered_array.push(element) if yield(element) }

    if filtered_array == self
      return true
    else
      return false
    end
  end

  def my_any?
    return self unless block_given?

    filtered_array = []
    self.my_each { |element| filtered_array.push(element) if yield(element) }

    if filtered_array != []
      return true
    elsif filtered_array == []
      return false
    end

  end

  def my_none?
    return self unless block_given?

    filtered_array = []
    self.my_each { |element| filtered_array.push(element) if yield(element) }

    if filtered_array == []
      return true
    elsif filtered_array != []
      return false
    end

  end

  def my_count
    return self.length unless block_given?

    filtered_array = []
    self.my_each { |element| filtered_array.push(element) if yield(element) }

    return filtered_array.length

  end

  def my_map
    return self unless block_given?

    filtered_array = []
    self.my_each { |element| filtered_array.push(yield(element)) }

    return filtered_array
  end

  def my_inject(*args)

    case args
    in [a] if a.is_a?(Symbol)
      symbol = a
    in [a] if a.is_a?(Object)
      initial_value = a
    in [a, b]
      initial_value = a
      symbol = b
    else
      initial_value = nil
      symbol = nil
    end

    sum = initial_value || first

    if block_given?
      my_each_with_index do |element, index|
        next if initial_value.nil? && index.zero?
        sum = yield(sum, element)
      end
    elsif symbol
      my_each_with_index do |element, index|
        next if initial_value.nil? && index.zero?

        sum = sum.send(symbol, element)
      end
    end
  sum
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
