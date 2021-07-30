def sluggish_octopus(arr)
    max_fish = arr.first
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            max_fish = arr[i] if arr[i].length > arr[j].length 
        end
    end
    max_fish
end

class Array
    def merge_sort(&prc)
      prc ||= Proc.new { |ele_1, ele_2| ele_1 <=> ele_2 }
      return self if self.length <= 1
      midpoint = self.length / 2
      sorted_left = self.take(midpoint).merge_sort(&prc)
      sorted_right = self.drop(midpoint).merge_sort(&prc)
  
      Array.merge(sorted_left, sorted_right, &prc)
    end
  
    private
    def self.merge(left, right, &prc)
      merged = []
      until left.empty? || right.empty?
        if prc.call(left.first, right.first) <= 1
          merged << left.shift
        else
          merged << right.shift
        end
      end
      merged + left + right
    end
  end

def clever_octopus(arr)
    longest_fish = arr.first
    (0...arr.length).each do |i|
        longest_fish = arr[i] if longest_fish.length < arr[i].length
    end
    longest_fish
end

def slow_dance(str, arr)
    (0...arr.length).each do |i|
        return i if str == arr[i]
    end
end

def fast_dance(str, hash)
    hash[str]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

slow_dance("up", tiles_array)

slow_dance("right-down", tiles_array)

new_tiles_data_structure = {"up" => 0, 
"right-up" => 1, 
"right" => 2, 
"right-down" => 3, 
"down" => 4, 
"left-down" => 5, 
"left" => 6,  
"left-up" => 7 }

fast_dance("up", new_tiles_data_structure)

fast_dance("right-down", new_tiles_data_structure)