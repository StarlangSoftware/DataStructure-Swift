import XCTest
@testable import DataStructure

final class CounterHashMapTest: XCTestCase {

    func testPut1(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item3")
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item1")
        XCTAssertEqual(3, counterHashMap.count(key: "item1"))
        XCTAssertEqual(2, counterHashMap.count(key: "item2"))
        XCTAssertEqual(1, counterHashMap.count(key: "item3"))
    }

    func testPut2(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        for _ in 0..<1000{
            counterHashMap.put(key: String(Int.random(in: 0..<1000)))
        }
        var count : Int = 0
        for i in 0..<1000{
            count += counterHashMap.count(key: String(i))
        }
        XCTAssertEqual(1000, count)
    }

    func testSumOfCounts(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        for _ in 0..<1000{
            counterHashMap.put(key: String(Int.random(in: 0..<1000)))
        }
        XCTAssertEqual(1000, counterHashMap.sumOfCounts())
    }

    func testPut3(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        for _ in 0..<1000000{
            counterHashMap.put(key: String(Int.random(in: 0..<1000000)))
        }
        XCTAssertEqual(Double(counterHashMap.size()) / 1000000.0, 0.632, accuracy:0.001)
    }

    func testPutNTimes1(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap.putNTimes(key: "item1", N: 2)
        counterHashMap.putNTimes(key: "item2", N: 3)
        counterHashMap.putNTimes(key: "item3", N: 6)
        counterHashMap.putNTimes(key: "item1", N: 2)
        counterHashMap.putNTimes(key: "item2", N: 3)
        counterHashMap.putNTimes(key: "item1", N: 2)
        XCTAssertEqual(6, counterHashMap.count(key: "item1"))
        XCTAssertEqual(6, counterHashMap.count(key: "item2"))
        XCTAssertEqual(6, counterHashMap.count(key: "item3"))
    }

    func testPutNTimes2(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        for i in 0..<1000{
            counterHashMap.putNTimes(key: String(Int.random(in: 0..<1000)), N: i + 1)
        }
        XCTAssertEqual(500500, counterHashMap.sumOfCounts())
    }

    func testMax(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item3")
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item1")
        XCTAssertEqual("item1", counterHashMap.max())
    }

    func testMaxThreshold1(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item3")
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item1")
        XCTAssertEqual("item1", counterHashMap.max(threshold: 0.4999))
        XCTAssertNotEqual("item1", counterHashMap.max(threshold: 0.5001))
    }

    func testMaxThreshold2(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        for _ in 0..<1000000{
            counterHashMap.put(key: String(Int.random(in: 0..<100)))
        }
        let probability : Double = Double(counterHashMap.count(key: counterHashMap.max()!)) / 1000000.0
        XCTAssertNotNil(counterHashMap.max(threshold: probability - 0.001))
        XCTAssertNil(counterHashMap.max(threshold: probability + 0.001))
    }

    func testAdd1(){
        let counterHashMap1 : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap1.put(key: "item1")
        counterHashMap1.put(key: "item2")
        counterHashMap1.put(key: "item3")
        counterHashMap1.put(key: "item1")
        counterHashMap1.put(key: "item2")
        counterHashMap1.put(key: "item1")
        let counterHashMap2 : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap2.putNTimes(key: "item1", N: 2)
        counterHashMap2.putNTimes(key: "item2", N: 3)
        counterHashMap2.putNTimes(key: "item3", N: 6)
        counterHashMap2.putNTimes(key: "item1", N: 2)
        counterHashMap2.putNTimes(key: "item2", N: 3)
        counterHashMap2.putNTimes(key: "item1", N: 2)
        counterHashMap1.add(toBeAdded: counterHashMap2)
        XCTAssertEqual(9, counterHashMap1.count(key: "item1"))
        XCTAssertEqual(8, counterHashMap1.count(key: "item2"))
        XCTAssertEqual(7, counterHashMap1.count(key: "item3"))
    }

    func testAdd2(){
        let counterHashMap1 : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap1.put(key: "item1")
        counterHashMap1.put(key: "item2")
        counterHashMap1.put(key: "item1")
        counterHashMap1.put(key: "item2")
        counterHashMap1.put(key: "item1")
        let counterHashMap2 : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap2.put(key: "item4")
        counterHashMap2.putNTimes(key: "item5", N: 4)
        counterHashMap2.put(key: "item2")
        counterHashMap1.add(toBeAdded: counterHashMap2)
        XCTAssertEqual(3, counterHashMap1.count(key: "item1"))
        XCTAssertEqual(3, counterHashMap1.count(key: "item2"))
        XCTAssertEqual(1, counterHashMap1.count(key: "item4"))
        XCTAssertEqual(4, counterHashMap1.count(key: "item5"))
    }

    func testAdd3(){
        let counterHashMap1 : CounterHashMap<Int> = CounterHashMap<Int>()
        for i in 0..<1000{
            counterHashMap1.put(key: i)
        }
        let counterHashMap2 : CounterHashMap<Int> = CounterHashMap<Int>()
        for i in 500..<1000{
            counterHashMap2.putNTimes(key: 1000 + i, N: i + 1)
        }
        counterHashMap1.add(toBeAdded: counterHashMap2)
        XCTAssertEqual(1500, counterHashMap1.size())
    }

    func testTopN1(){
        let counterHashMap : CounterHashMap<String> = CounterHashMap<String>()
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item3")
        counterHashMap.put(key: "item1")
        counterHashMap.put(key: "item2")
        counterHashMap.put(key: "item1")
        XCTAssertEqual("item1", counterHashMap.topN(N: 1)[0].item)
        XCTAssertEqual("item2", counterHashMap.topN(N: 2)[1].item)
        XCTAssertEqual("item3", counterHashMap.topN(N: 3)[2].item)
    }

    func testTopN2(){
        let counterHashMap : CounterHashMap<Int> = CounterHashMap<Int>()
        for i in 0..<1000{
            counterHashMap.putNTimes(key: i, N: 2 * i + 2)
        }
        XCTAssertEqual(990, counterHashMap.topN(N: 10)[9].item)
        XCTAssertEqual(900, counterHashMap.topN(N: 100)[99].item)
    }


    static var allTests = [
        ("testExample1", testPut1),
        ("testExample2", testPut2),
        ("testExample3", testSumOfCounts),
        ("testExample4", testPut3),
        ("testExample5", testPutNTimes1),
        ("testExample6", testPutNTimes2),
        ("testExample7", testMax),
        ("testExample8", testMaxThreshold1),
        ("testExample9", testMaxThreshold2),
        ("testExample10", testAdd1),
        ("testExample11", testAdd2),
        ("testExample12", testAdd3),
        ("testExample13", testTopN1),
        ("testExample14", testTopN2),
    ]
}
