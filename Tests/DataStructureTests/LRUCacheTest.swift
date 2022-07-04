import XCTest
@testable import DataStructure

final class LRUCacheTest: XCTestCase {

    func test1() {
        let cache : LRUCache = LRUCache<String, String>(cacheSize: 5)
        cache.add(key: "item1", data: "1")
        cache.add(key: "item2", data: "2")
        cache.add(key: "item3", data: "3")
        XCTAssertTrue(cache.contains(key: "item2"))
        XCTAssertFalse(cache.contains(key: "item4"))
    }

    func test2() {
        let cache : LRUCache = LRUCache<String, String>(cacheSize: 2)
        cache.add(key: "item1", data: "1")
        cache.add(key: "item2", data: "2")
        cache.add(key: "item3", data: "3")
        XCTAssertTrue(cache.contains(key: "item2"))
        XCTAssertFalse(cache.contains(key: "item1"))
    }

    func test3() {
        let cache : LRUCache = LRUCache<Int, Int>(cacheSize: 10000)
        for i in 0...10000{
            cache.add(key: i, data: i)
        }
        for _ in 0...1000{
            XCTAssertTrue(cache.contains(key: Int.random(in: 0..<10000)))
        }
    }

    func test4() {
        let cache : LRUCache = LRUCache<Int, Int>(cacheSize: 1000000)
        for i in 0...1000000{
            cache.add(key: Int.random(in: 0..<1000000), data: i)
        }
        var count : Double = 0
        for i in 0...1000000{
            if cache.contains(key: i){
                count += 1
            }
        }
        XCTAssertEqual(0.632, count / 1000000.0, accuracy: 0.001)
    }
    
    func test5(){
        let size : Int = 100000
        let cache : LRUCache = LRUCache<Int, Int>(cacheSize: size)
        for i in 0...size{
            cache.add(key: i, data: i)
        }
        for _ in 0...100{
            let time1 = Int64(Date().timeIntervalSince1970.magnitude * 1000)
            for _ in 0...size{
                let data = Int.random(in: size..<2 * size)
                cache.add(key: data, data: data)
            }
            let time2 = Int64(Date().timeIntervalSince1970.magnitude * 1000)
            print(time2 - time1)
        }
    }

    static var allTests = [
        ("testExample1", test1),
        ("testExample2", test2),
        ("testExample3", test3),
        ("testExample4", test4),
        ("testExample5", test5),
    ]
}
