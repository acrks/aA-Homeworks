class Stack
    def initialize
      @ivar = []
    end

    def push(el)
      @ivar << el
    end

    def pop
      result = @ivar[-1]
      @ivar = @ivar[0...-1]
      result
    end

    def peek
      @ivar[-1]
    end
  end

# s = Stack.new
# s.push(0)
# s.push(1)
# s.push(3)
# s.push(4)
# p s.pop
# p s.peek

class Queue
    def initialize
    @ivar = []
    end
    
    def enqueue(el)
        @ivar << el
    end

    def dequeue
        @ivar.shift
    end

    def peek
        @ivar[0]
    end
end

# q = Queue.new
# q.enqueue(0)
# q.enqueue(1)
# q.enqueue(3)
# q.enqueue(4)
# p q.dequeue
# p q.peek

class Map
    def initialize
        @myMap = Array.new()
    end

    def set(key, value)
        changed = false
        @myMap.each do |i|
            if i[0] == key
                i[1] = value
                changed = true
            end
        end
        @myMap << [key,value] if !changed
    end
    
    def get(key)
        @myMap.each do |i|
            if i[0] == key
                return i[1]
            end
        end
    end

    def delete(key)
        @myMap.each do |i|
            if i[0] == key
                @myMap.delete(i)
            end
        end
    end
    
    def show
        new_str = ""
        @myMap.each do |i|
            new_str += "\["+ i.join(", ") + "\]" + ", " 
        end
        new_str[0...-2]
    end
end

m = Map.new()
m.set(1, "apple")
m.set(3, "banana")
m.set(2, "orange")
p m.show
m.set(1, "pear")
p m.show
m.delete(2)
p m.show
p m.get(3)
