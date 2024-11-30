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
