import XCTest
@testable import DataStructure

final class TreeTest: XCTestCase {
    
    func testTree(){
        let tree: Tree<Int> = Tree()
        tree.insert(data: 4)
        tree.insert(data: 6)
        tree.insert(data: 2)
        tree.insert(data: 5)
        tree.insert(data: 3)
        tree.insert(data: 1)
        tree.insert(data: 7)
        XCTAssertNotNil(tree.search(value: 3))
        XCTAssertNil(tree.search(value:8))
    }

    func testTree2(){
        let tree: AvlTree<Int> = AvlTree()
        for i in 1..<32{
            tree.insert(item: i)
        }
        for i in 1..<32{
            XCTAssertNotNil(tree.search(value: i))
        }
        XCTAssertNil(tree.search(value:32))
    }

    func testTree3(){
        let tree: BTree<Int> = BTree(d: 1)
        for i in 1..<32{
            tree.insert(data: i)
        }
        for i in 1..<32{
            XCTAssertNotNil(tree.search(value: i))
        }
        XCTAssertNil(tree.search(value:32))
    }

    static var allTests = [
        ("testExample1", testTree),
        ("testExample2", testTree2),
        ("testExample3", testTree3),
    ]
}
