# Main.rb

require_relative 'hash_map'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('apple', 'green')

puts test
puts test.keys.inspect
puts test.get('grape')
puts test.has?('banana')
puts test.has?('dinosaur')
puts test.remove('carrot')
puts test.get('carrot')
puts test.has?('carrot')
puts test.length
puts test.clear
puts test.length
puts test.has?('elephant')