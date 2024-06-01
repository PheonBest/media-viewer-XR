import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// How to use safe subscripting:
// let array = [1, 2, 3]
// print(array[safe: 1]) // Optional(2)
// print(array[safe: 10]) // nil
