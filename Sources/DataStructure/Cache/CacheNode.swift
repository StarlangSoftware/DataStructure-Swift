//
//  CacheNode.swift
//  
//
//  Created by Olcay Taner YILDIZ on 14.08.2020.
//

import Foundation

class CacheNode<K, T>{
    private var __key: K
    private var __data: T
    private var __previous: CacheNode? = nil
    private var __next: CacheNode? = nil

    /**
    A constructor of CacheNode class which takes a key and a data as inputs and initializes private fields with
    these inputs.

     - Parameters:
        - key : K type input for representing keys.
        - data : T type input values represented by keys.
    */
    init(key: K, data: T){
        self.__key = key
        self.__data = data
        self.__previous = nil
        self.__next = nil
    }

    /**
    Getter for data value.

    - Returns: data value.
    */
    func getData() -> T{
        return self.__data
    }

    /**
    Getter for key value.

    - Returns: key value.
    */
    func getKey() -> K{
        return self.__key
    }

    /**
    Getter for the previous CacheNode.

    - Returns: previous CacheNode.
    */
    func getPrevious() -> CacheNode?{
        return self.__previous
    }

    /**
    Getter for the next CacheNode.

    - Returns: next CacheNode.
    */
    func getNext() -> CacheNode?{
        return self.__next
    }

    /**
    Setter for the previous CacheNode.

    - Parameter previous : previous CacheNode.
    */
    func setPrevious(previous: CacheNode?){
        self.__previous = previous
    }

    /**
    Setter for the next CacheNode.

    - Parameter: next : next CacheNode.
    */
    func setNext(next: CacheNode){
        self.__next = next
    }

}
