Cache
============

The idea of caching items for fast retrieval goes back nearly to the beginning of the computer science. We also use that idea and use a LRU cache for storing morphological analyses of surface forms. Before analyzing a surface form, we first look up to the cache, and if there is an hit, we just take the analyses from the cache. If there is a miss, we analyze the surface form and put the morphological analyses of that surface form in the LRU cache. As can be expected, the speed of the caching mechanism surely depends on the size of the cache.

For Developers
============
You can also see [Java](https://github.com/starlangsoftware/DataStructure), [Python](https://github.com/starlangsoftware/DataStructure-Py), [Cython](https://github.com/starlangsoftware/DataStructure-Cy), [C](https://github.com/starlangsoftware/DataStructure-C), [C++](https://github.com/starlangsoftware/DataStructure-CPP), [Php](https://github.com/starlangsoftware/DataStructure-Php), [Js](https://github.com/starlangsoftware/DataStructure-Js), or [C#](https://github.com/starlangsoftware/DataStructure-CS) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called DataStructure-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/DataStructure-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run DataStructure-Swift.

Detailed Description
============

+ [CounterHashMap](#counterhashmap)
+ [LRUCache](#lrucache)

## CounterHashMap

CounterHashMap bir veri tipinin kaç kere geçtiğini hafızada tutmak için kullanılmaktadır.

Bir CounterHashMap yaratmak için

	a = CounterHashMap()

Hafızaya veri eklemek için

	func put(key: K)

Örneğin,

	a.put(key: "ali");

Bu aşamanın ardından "ali" nin sayacı 1 olur.

Hafızaya o veriyi birden fazla kez eklemek için

	func putNTimes(key: K, N: Int)

Örneğin,

	a.putNTimes(key: "veli", N: 5)

Bu aşamanın ardından "ali"'nin sayacı 5 olur.

Hafızada o verinin kaç kere geçtiğini bulmak için

	func count(key: K) -> Int

Örneğin, "veli" nin kaç kere geçtiğini bulmak için

	kacKere = a.count(key: "veli")

Bu aşamanın ardından kacKere değişkeninin değeri 5 olur.

Hafızada hangi verinin en çok geçtiğini bulmak için

	func max(threshold: Double = 0.0) -> K?

Örneğin,

	kelime = a.max()

Bu aşamanın ardından kelime "veli" olur.

## LRUCache

LRUCache veri cachelemek için kullanılan bir veri yapısıdır. LRUCache en yakın zamanda 
kullanılan verileri öncelikli olarak hafızada tutar. Bir LRUCache yaratmak için

	init(cacheSize: Int)

kullanılır. cacheSize burada cachelenecek verinin büyüklüğünün limitini göstermektedir.

Cache'e bir veri eklemek için

	func add(key: K, data: T)

kullanılır. data burada eklenecek veriyi, key anahtar göstergeyi göstermektedir.

Cache'de bir veri var mı diye kontrol etmek için

	func contains(key: K) -> Bool

kullanılır.

Cache'deki veriyi anahtarına göre getirmek için

	func get(key: K) -> T?

kullanılır.

For Contibutors
============

### Package.swift file

1. Dependencies should be given w.r.t github.
```
    dependencies: [
        .package(name: "MorphologicalAnalysis", url: "https://github.com/StarlangSoftware/TurkishMorphologicalAnalysis-Swift.git", .exact("1.0.6"))],
```
2. Targets should include direct dependencies, files to be excluded, and all resources.
```
    targets: [
        .target(
	dependencies: ["MorphologicalAnalysis"],
	exclude: ["turkish1944_dictionary.txt", "turkish1944_wordnet.xml",
	"turkish1955_dictionary.txt", "turkish1955_wordnet.xml",
	"turkish1959_dictionary.txt", "turkish1959_wordnet.xml",
	"turkish1966_dictionary.txt", "turkish1966_wordnet.xml",
	"turkish1969_dictionary.txt", "turkish1969_wordnet.xml",
	"turkish1974_dictionary.txt", "turkish1974_wordnet.xml",
	"turkish1983_dictionary.txt", "turkish1983_wordnet.xml",
	"turkish1988_dictionary.txt", "turkish1988_wordnet.xml",
	"turkish1998_dictionary.txt", "turkish1998_wordnet.xml"],
	resources:
[.process("turkish_wordnet.xml"),.process("english_wordnet_version_31.xml"),.process("english_exception.xml")]),
```
3. Test targets should include test directory.
```
	.testTarget(
		name: "WordNetTests",
		dependencies: ["WordNet"]),
```

### Data files
1. Add data files to the project folder.

### Swift files

1. Do not forget to comment each function.
```
   /**
     * Returns the value to which the specified key is mapped.
     - Parameters:
        - id: String id of a key
     - Returns: value of the specified key
     */
    public func singleMap(id: String) -> String{
        return map[id]!
    }
```
2. Do not forget to define classes as open in order to be able to extend them in other packages.
```
	open class Word : Comparable, Equatable, Hashable
```
3. Function names should follow caml case.
```
	public func map(id: String)->String?
```
4. Write getter and setter methods.
```
	public func getSynSetId() -> String{
	public func setOrigin(origin: String){
```
5. Use separate test class extending XCTestCase for testing purposes.
```
final class WordNetTest: XCTestCase {
    var turkish : WordNet = WordNet()
    
    func testSize() {
        XCTAssertEqual(78326, turkish.size())
    }
```
6. Enumerated types should be declared as enum.
```
public enum CategoryType : String{
    case MATHEMATICS
    case SPORT
    case MUSIC
```
7. Implement == operator and hasher method for hashing purposes.
```
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    public static func == (lhs: Relation, rhs: Relation) -> Bool {
        return lhs.name == rhs.name
    }
```
8. Make classes Comparable for comparison, Equatable for equality, and Hashable for hashing check.
```
	open class Word : Comparable, Equatable, Hashable
```
9. Implement < operator for comparison purposes.
```
    public static func < (lhs: Word, rhs: Word) -> Bool {
        return lhs.name < rhs.name
    }
```
10. Implement description for toString method.
```
	open func description() -> String{
```
11. Use Bundle and XMLParserDelegate for parsing Xml files.
```
	let url = Bundle.module.url(forResource: fileName, withExtension: "xml")
	var parser : XMLParser = XMLParser(contentsOf: url!)!
	parser.delegate = self
	parser.parse()
```
also use parser method.
```
public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
```
