//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 14.08.2020.
//

import Foundation

class CacheLinkedList<K, T>{
    
    private var _head: CacheNode<K, T>?
    private var _tail: CacheNode<K, T>?

    init(){
        self._head = nil
        self._tail = nil
    }

    /**
    The removeGiven method takes a CacheNode type input cacheNode. If cacheNode has a previous node, then assigns cacheNode's next node as previous node's next node. If cacheNode has not got a previous node, then assigns its next node as head node. Moreover, if cacheNode has a next node, then assigns cacheNode's previous node as next node's previous node; if not assigns tail node's previous node as tail. By doing so it removes the cacheNode from doubly list.

    - Parameter cacheNode : CacheNode type input to remove.
    */
    func removeGiven(cacheNode: CacheNode<K, T>){
        let previous : CacheNode<K, T>? = cacheNode.getPrevious()
        let next : CacheNode<K, T>? = cacheNode.getNext()
        if previous != nil{
            previous!.setNext(next: next!)
        } else{
            self._head = self._head!.getNext()
        }
        if next != nil{
            next!.setPrevious(previous: previous)
        } else{
            self._tail = self._tail!.getPrevious()
        }
    }

    /**
    The add method adds given CacheNode type input cacheNode to the beginning of the doubly list.
    First it sets cacheNode's previous node as null and cacheNode's next node as head node. If head node is not null then it assigns cacheNode's previous node as head node and if tail is null then it assigns cacheNode as tail.

    - Parameter cacheNode : CacheNode type input to add to the doubly list.
    */
    func add(cacheNode: CacheNode<K, T>){
        cacheNode.setPrevious(previous: nil)
        if self._head != nil{
            cacheNode.setNext(next: self._head!)
            self._head!.setPrevious(previous: cacheNode)
        }
        self._head = cacheNode
        if self._tail == nil{
            self._tail = cacheNode
        }
    }

    /**
    The remove method removes the last element of the doubly list. It assigns the previous node of
    current tail as new tail. If the current tail is null then it assigns head to null.

    - Returns: CacheNode type output tail which is removed from doubly list.
    */
    func remove() -> CacheNode<K, T>{
        let removed : CacheNode<K, T> = self._tail!
        self._tail = self._tail!.getPrevious()
        if self._tail == nil{
            self._head = nil
        }
        return removed
    }

}
