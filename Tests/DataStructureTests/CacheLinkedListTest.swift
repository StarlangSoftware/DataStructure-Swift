import XCTest
@testable import DataStructure

final class CacheLinkedListTest: XCTestCase {
    func test1() {
        let cacheLinkedList : CacheLinkedList<String, String> = CacheLinkedList<String, String>()
        cacheLinkedList.add(cacheNode: CacheNode(key: "item1", data: "1"))
        cacheLinkedList.add(cacheNode: CacheNode(key: "item2", data: "2"))
        var removed : CacheNode<String, String> = cacheLinkedList.remove()
        XCTAssertEqual("item1", removed.getKey())
        XCTAssertEqual("1", removed.getData())
        removed = cacheLinkedList.remove()
        XCTAssertEqual("item2", removed.getKey())
        XCTAssertEqual("2", removed.getData())
    }

    func test2() {
        let cacheLinkedList : CacheLinkedList<String, String> = CacheLinkedList<String, String>()
        for i in 0..<1000{
            cacheLinkedList.add(cacheNode: CacheNode<String, String>(key: String(i), data: String(i)))
        }
        for i in 0..<1000{
            let removed : CacheNode<String, String> = cacheLinkedList.remove()
            XCTAssertEqual(String(i), removed.getKey())
            XCTAssertEqual(String(i), removed.getData())
        }
    }

    static var allTests = [
        ("testExample1", test1),
        ("testExample2", test2),
    ]
}
