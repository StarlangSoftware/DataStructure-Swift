import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CacheLinkedListTest.allTests),
        testCase(LRUCacheTest.allTests),
        testCase(CounterHashMapTest.allTests),
    ]
}
#endif
