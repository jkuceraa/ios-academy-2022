import Foundation

// 'Node' represents the Tree data structure
// If you are not familiar with trees you can find a thorough explanation here: https://en.wikipedia.org/wiki/Tree_(data_structure)

class Node {
    let value: Int
    private(set) var children: [Node]
    
    init(value: Int, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    var maximum: Int {
        var toSearch: [Node] = self.children
        var max = self.value
        while(toSearch.count>0){
            if(toSearch[0].value>max){
                max = toSearch[0].value
            }
            if(toSearch[0].children.count>0){
                toSearch.append(contentsOf: toSearch[0].children)
            }
            toSearch.remove(at:0)
        }
        return max
    }
    
    func append(node: Node) {
        // Implement appending node to the children array
        self.children.append(node)
    }
    
    func removeNode(at index: Int) -> Node? {
        // Remove a child at given index
        // Do not crash when the index is out of range
        // Return a removed Node if any node was removed
        if(index<self.children.count){
            let x: Node = children[index]
            self.children.remove(at: index)
            return x
        } else{
            return nil
        }
    }
    
    func sortedValues() -> [Int] {
        var toSearch: [Node] = self.children
        var values: [Int] = [self.value]
        while(toSearch.count>0){
            values.append(toSearch[0].value)
            if(toSearch[0].children.count>0){
                toSearch.append(contentsOf: toSearch[0].children)
            }
            toSearch.remove(at:0)
        }
        values.sort()
        return values
    }
}

let tree = Node(
    value: 48,
    children: [
        Node(
            value: 2,
            children: [
                Node(value: 2, children: [])
            ]),
        Node(
            value: -5,
            children: [
                Node(value: 99, children: []),
                Node(value: 7, children: [])
            ]),
        Node(
            value: 103,
            children: [])
    ])

tree.children[0].append(node: Node(value: 2048, children: []))
tree.maximum == 2048 // MUST BE TRUE
tree.sortedValues() == [-5, 2, 2, 7, 48, 99, 103, 2048] // MUST BE TRUE
_ = tree.removeNode(at: 0)
tree.maximum == 103 // MUST BE TRUE
