//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 4.07.2022.
//

import Foundation

public class BTreeNode<T : Comparable>{
    
    var K : [T]
    var m : Int
    var d : Int
    var leaf : Bool
    var children : [BTreeNode<T>]
    
    public init(d: Int){
        m = 0
        self.d = d
        leaf = true
        K = []
        children = []
    }
    
    public convenience init(d: Int, firstChild: BTreeNode<T>, secondChild: BTreeNode<T>, newK: T){
        self.init(d: d)
        leaf = false
        m = 1
        children.append(firstChild)
        children.append(secondChild)
        K.append(newK)
    }
    
    func position(value: T) -> Int{
        if m == 0{
            return 0
        }
        if value > K[m - 1]{
            return m
        } else {
            for i in 0..<m{
                if value <= K[i]{
                    return i
                }
            }
        }
        return -1
    }
    
    private func insertIntoK(index: Int, insertedK: T){
        if index < K.count{
            for i in stride(from: m, to: index, by: -1){
                K[i] = K[i - 1]
            }
            K[index] = insertedK
        } else {
            K.append(insertedK)
        }
    }
    
    private func moveHalfOfTheKToNewNode(newNode: BTreeNode<T>){
        for i in 0..<d{
            newNode.K.append(K[i + d + 1])
        }
        newNode.m = d
    }
    
    private func moveHalfOfTheChildrenToNewNode(newNode: BTreeNode<T>){
        for i in 0..<d{
            newNode.children.append(children[i + d + 1])
        }
    }
    
    private func moveHalfOfTheElementsToNewNode(newNode: BTreeNode<T>){
        moveHalfOfTheKToNewNode(newNode: newNode)
        moveHalfOfTheChildrenToNewNode(newNode: newNode)
    }
    
    public func insertNode(value: T, isRoot: Bool) -> BTreeNode<T>?{
        let child = position(value: value)
        var s: BTreeNode<T>?
        var newNode: BTreeNode<T>
        if !children[child].leaf{
            s = children[child].insertNode(value: value, isRoot: false)
        } else {
            s = children[child].insertLeaf(value: value)
        }
        if s == nil{
            return nil
        }
        insertIntoK(index: child, insertedK: children[child].K[d])
        if m < 2 * d{
            children.append(s!)
            m = m + 1
            return nil
        } else {
            newNode = BTreeNode(d: d)
            newNode.leaf = false
            moveHalfOfTheKToNewNode(newNode: newNode)
            newNode.children.append(s!)
            m = d
            if isRoot{
                return BTreeNode(d: d, firstChild: self, secondChild: newNode, newK: self.K[d])
            } else {
                return newNode
            }
        }
    }
    
    public func insertLeaf(value: T) -> BTreeNode<T>?{
        let child = position(value: value)
        insertIntoK(index: child, insertedK: value)
        if m < 2 * d{
            m = m + 1
            return nil
        } else {
            let newNode = BTreeNode(d: d)
            moveHalfOfTheKToNewNode(newNode: newNode)
            m = d
            return newNode
        }
    }
}
