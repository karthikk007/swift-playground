import UIKit

var greeting = "Hello, playground"

func example(of: String, completion: ()->()) {
    print("------ Example of " + of + " -----")
    completion()
    print("\n")
}


example(of: "Binary tree") {
    // leaf nodes
//    let node5 = BinaryTree.node(.empty, "5", .empty)
//    let nodeA = BinaryTree.node(.empty, "a", .empty)
//    let node10 = BinaryTree.node(.empty, "10", .empty)
//    let node4 = BinaryTree.node(.empty, "4", .empty)
//    let node3 = BinaryTree.node(.empty, "3", .empty)
//    let nodeB = BinaryTree.node(.empty, "b", .empty)
//
//    // intermediate nodes on the left
//    let Aminus10 = BinaryTree.node(nodeA, "-", node10)
//    let timesLeft = BinaryTree.node(node5, "*", Aminus10)
//
//    // intermediate nodes on the right
//    let minus4 = BinaryTree.node(.empty, "-", node4)
//    let divide3andB = BinaryTree.node(node3, "/", nodeB)
//    let timesRight = BinaryTree.node(minus4, "*", divide3andB)
//
//    // root node
//    let tree = BinaryTree.node(timesLeft, "+", timesRight)
    
    let node0 = BinaryTree.node(.empty, 0, .empty)
    let node2 = BinaryTree.node(.empty, 2, .empty)
    
    let node1 = BinaryTree.node(node0, 1, node2)

    let node4 = BinaryTree.node(.empty, 4, .empty)
    let node6 = BinaryTree.node(.empty, 6, .empty)

    let node5 = BinaryTree.node(node4, 5, node6)
    

    let node3 = BinaryTree.node(node1, 3, node5)
    
    let root = node3
    
    let tree = root
    
    print(tree.count)
    
    
    example(of: "In order traversal") {
        tree.traverseInOrder { print($0) }
    }
    
    example(of: "In pre traversal") {
        tree.traversePreOrder { print($0) }
    }
    
    example(of: "In Post traversal") {
        tree.traversePostOrder { print($0) }
    }
    
    example(of: "search node") {
        let node = tree.search(searchValue: 5)
        if let value = node?.rawValue {
            print(value)
        }
        print(String(describing: node))
    }
    
    example(of: "max depth") {
        print("depth = \(tree.maxDepth())")
    }
    
    example(of: "max sum list") {
        let (max, list) = tree.maxSumList()
        print("max = \(max)")
        print("list = \(list)")
    }
    
    example(of: "max sum") {
        let max = tree.maxSum()
        print("max = \(max)")
    }
}
