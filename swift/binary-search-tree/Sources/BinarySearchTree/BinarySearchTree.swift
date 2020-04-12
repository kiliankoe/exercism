public class BinarySearchTree<Data> where Data: Comparable {
    let data: Data
    var left: BinarySearchTree<Data>?
    var right: BinarySearchTree<Data>?

    init(_ data: Data) {
        self.data = data
    }

    func insert(_ newData: Data) {
        if newData <= data {
            guard let left = left else {
                self.left = BinarySearchTree(newData)
                return
            }
            left.insert(newData)
        } else {
            guard let right = right else {
                self.right = BinarySearchTree(newData)
                return
            }
            right.insert(newData)
        }
    }

    func allData() -> [Data] {
        (left?.allData() ?? []) + [data] + (right?.allData() ?? [])
    }
}
