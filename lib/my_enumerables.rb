module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    new_array = []
    each do |item|
      new_array.push item if yield(item)
    end
    new_array
  end

  def my_all?
    bool = true
    each do |item|
      bool = false unless yield(item)
    end
    bool
  end

  def my_any?
    bool = false
    each do |item|
      bool = true if yield(item)
    end
    bool
  end

  def my_none?
    bool = true
    each do |item|
      bool = false if yield(item)
    end
    bool
  end

  def my_count
    count = 0
    if block_given?
      each do |item|
        count += 1 if yield(item)
      end
    else
      each do |item|
        count += 1
      end
    end
    count
  end

  def my_map
    new_array = []
    each do |item|
      new_array.push yield(item)
    end
    new_array
  end

  def my_inject(initial_value)
    memo = initial_value
    each do |item|
      memo = yield(memo, item)
    end
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
