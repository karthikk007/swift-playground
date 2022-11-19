import Foundation

public indirect enum BinaryTree<Value: Comparable> {
    case empty
    case node(BinaryTree, Value, BinaryTree)
    
    public var rawValue: Any? {
        switch self {
        case .empty:
            return nil
        case .node(_, let value, _):
            return value
        }
    }
}


extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
                return "value: \(value) left = [ " + left.description + " ] right = [ " + right.description + " ]"
        case .empty:
            return ""
        }
    }
}

extension BinaryTree {
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return left.count + 1 + right.count
        }
    }
}

extension BinaryTree: Equatable where Value: Equatable {}
extension BinaryTree: Comparable where Value: Comparable {}

//extension BinaryTree: Equatable {
//    public static func == (lhs: BinaryTree<Value>, rhs: BinaryTree<Value>) -> Bool {
//        return lhs.rawVaue == rhs.rawVaue
//    }
//}


// traverse

extension BinaryTree {
    
    public func traverseInOrder(process: (Value) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (Value) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (Value) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    public func search(searchValue: Value) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
    
    public func maxDepth() -> Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return max(1 + left.maxDepth(), 1 + right.maxDepth())
        }
    }
    
    public func maxSum() -> Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, value, right):
            if let value = value as? Int {
                return max(left.maxSum() + value, right.maxSum() + value)
            }
            
            return 0
        }
    }
    
    
    public func maxSumList() -> (Int, [Int]) {
        switch self {
        case .empty:
            return (0, [])
        case let .node(left, value, right):
            var (ls, ll) = left.maxSumList()
            var (rs, rl) = right.maxSumList()
            
            if let value = value as? Int {
                if ls > rs {
                    ll.append(value)
                    return (ls + value, ll)
                } else {
                    rl.append(value)
                    return (rs + value, rl)
                }
            }
            
            return (0, [])
            
//            var leftList = left.maxx()
//            var rightList = right.maxx()
//
//            let leftSum = leftList.reduce(0, +)
//            let rightSum = rightList.reduce(0, +)
//
//            if let value = value as? Int {
//                if leftSum > rightSum {
//                    leftList.append(value)
//                    return leftList
//                } else {
//                    rightList.append(value)
//                    return rightList
//                }
//            }
//
//            return []
        }
    }
}

class VisitedNodes {
    var list = [Int]()
}
