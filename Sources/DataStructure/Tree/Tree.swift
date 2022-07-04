//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 4.07.2022.
//

import Foundation

public class Tree<T : Comparable>{
    
    var root: TreeNode<T>? = nil

    public init(){
        
    }
    
    public func search(value: T)-> TreeNode<T>?{
        var d : TreeNode<T>? = root
        while d != nil{
            if d?.data == value{
                return d
            } else {
                if d!.data > value{
                    d = d?.left
                } else {
                    d = d?.right
                }
            }
        }
        return nil
    }
    
    internal func insertChild(parent: TreeNode<T>?, child: TreeNode<T>){
        if parent == nil{
            root = child
        } else {
            if child.data < parent!.data{
                parent?.left = child
            } else {
                parent?.right = child
            }
        }
    }
    
    public func insert(node: TreeNode<T>){
        var y : TreeNode<T>? = nil
        var x : TreeNode<T>? = root
        while x != nil{
            y = x
            if node.data < x!.data{
                x = x?.left
            } else {
                x = x?.right
            }
        }
        insertChild(parent: y, child: node)
    }
    
    public func insert(data: T){
        insert(node: TreeNode(data: data))
    }
}
