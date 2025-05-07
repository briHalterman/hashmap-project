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

    # Check if the key already exists in the bucket
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value # Overwrite the value
        return          # Exit early after update
      end
    end

    # If key was not found, add a new pair
    bucket << [key, value]
    @size += 1
  end

  def get(key)
    # Hash the key
    hash_code = hash(key)
    # Calculate the index
    index = hash_code % @capacity

    # Raise an error if the index is out of bounds
    raise IndexError if index.negative? || index >= @buckets.length

    # Get the bucket at that index
    bucket = @buckets[index]

    # Return nil if the bucket is empty
    if bucket.nil?
      return nil
    end

    # Loop through the bucket to find the key
    bucket.each do |pair|
      # Return value if found
      if pair[0] == key
        return pair[1]
      end

    end
    # Return nil if key not found
    nil
  end

  def has?(key)
    hash_code = hash(key)
    index = hash_code % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    if bucket.nil?
      return false
    end

    bucket.each do |pair|
      if pair[0] == key
        return true
      end
    end
    return false
  end

  def to_s
    result = []
    @buckets.each_with_index do |bucket, i|
      next if bucket.nil? || bucket.empty?
      result << "Bucket #{i}: #{bucket.inspect}"
    end
    result.join("\n")
  end
end
