class GraphNode
    def bfs(starting_node, target_value)
        arr = [starting_node]
        until arr.empty?
            node = arr.shift
            if node.value == target
                return node
            else
                node.children.each { |child| arr << child }
            end
        end
        return nil
        end
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]