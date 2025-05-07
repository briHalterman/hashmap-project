# HashMap class

class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    # Take the key, hash it, and convert it into a valid index for the buckets array
    hash_code = hash(key)
    index = hash_code % @capacity

    # Check that the index is valid
    raise IndexError if index.negative? || index >= @buckets.length

    # Grab bucket at index
    # If there's nothing there, start it as an empty array
    bucket = @buckets[index] ||= []
  end
end
