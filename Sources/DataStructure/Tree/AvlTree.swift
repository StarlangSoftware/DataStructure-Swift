//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 4.07.2022.
//

import Foundation

public class AvlTree<T : Comparable> : Tree<T>{
    
    public override init() {
    }
    
    public func height(d: AvlTreeNode<T>?) -> Int{
        if d == nil{
            return 0
        } else {
            return d!.height
        }
    }
    
    public func rotateLeft(k2: AvlTreeNode<T>) -> AvlTreeNode<T>{
        let k1 = k2.left as? AvlTreeNode<T>
        k2.left = k1?.right
        k1?.right = k2
        k2.height = max(height(d: k2.left as? AvlTreeNode<T>), height(d: k2.right as? AvlTreeNode<T>)) + 1
        k1?.height = max(height(d: k1?.left as? AvlTreeNode<T>), height(d: k1?.right as? AvlTreeNode<T>)) + 1
        return k1!
    }

    public func rotateRight(k1: AvlTreeNode<T>) -> AvlTreeNode<T>{
        let k2 = k1.right as? AvlTreeNode<T>
        k1.right = k2?.left
        k2?.left = k1
        k2!.height = max((k2!.left as! AvlTreeNode<T>).height, height(d: k2?.right as? AvlTreeNode<T>)) + 1
        k1.height = max(height(d: k1.left as? AvlTreeNode<T>), height(d: k1.right as? AvlTreeNode<T>)) + 1
        return k2!
    }
    
    public func doubleRotateLeft(k3: AvlTreeNode<T>) -> AvlTreeNode<T>{
        k3.left = rotateRight(k1: k3.left as! AvlTreeNode<T>)
        return rotateLeft(k2: k3)
    }
    
    public func doubleRotateRight(k1: AvlTreeNode<T>) -> AvlTreeNode<T>{
        k1.right = rotateLeft(k2: k1.right as! AvlTreeNode<T>)
        return rotateRight(k1: k1)
    }
    
    public func insert(node: AvlTreeNode<T>){
        let LEFT = 1, RIGHT = 2
        var y : AvlTreeNode<T>? = nil
        var x : AvlTreeNode<T>? = (root as? AvlTreeNode<T>)
        var t : AvlTreeNode<T>
        var dir1 : Int = 0, dir2 : Int = 0
        let c : Stack<AvlTreeNode<T>> = Stack()
        while x != nil{
            y = x
            c.push(item: y!)
            dir1 = dir2
            if node.data < x!.data{
                x = x!.left as? AvlTreeNode<T>
                dir2 = LEFT
            } else {
                x = x!.right as? AvlTreeNode<T>
                dir2 = RIGHT
            }
        }
        insertChild(parent: y, child: node)
        while !c.isEmpty(){
            x = c.pop()
            x?.height = max(height(d: (x?.left as? AvlTreeNode<T>)), height(d: (x?.right as? AvlTreeNode<T>))) + 1
            if abs(height(d: (x?.left as? AvlTreeNode<T>)) - height(d: (x?.right as? AvlTreeNode<T>))) == 2{
                if dir1 == LEFT{
                    if dir2 == LEFT{
                        t = rotateLeft(k2: x!)
                    } else {
                        t = doubleRotateLeft(k3: x!)
                    }
                } else {
                    if dir2 == LEFT{
                        t = doubleRotateRight(k1: x!)
                    } else {
                        t = rotateRight(k1: x!)
                    }
                }
                y = c.pop()
                insertChild(parent: y, child: t)
                break
            }
        }
    }
    
    public func insert(item: T){
        insert(node: AvlTreeNode<T>(data: item))
    }

}
