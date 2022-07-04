//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 4.07.2022.
//

import Foundation

public class BTree<T : Comparable>{
    
    var root : BTreeNode<T>? = nil
    var d : Int
    
    public init(d: Int){
        self.d = d
    }
    
    public func search(value: T) -> BTreeNode<T>?{
        var b : BTreeNode<T>?
        var child : Int
        b = root
        while !b!.leaf{
            child = (b?.position(value: value))!
            if child < b!.m && b?.K[child] == value{
                return b
            }
            b = b?.children[child]
        }
        child = (b?.position(value: value))!
        if child < b!.m && b!.K[child] == value{
            return b
        }
        return nil
    }
    
    public func insert(data: T){
        if root == nil{
            root = BTreeNode(d: d)
        }
        if ((root?.leaf) != nil){
            let s = root?.insertLeaf(value: data)
            if s != nil{
                let tmp = root
                root = BTreeNode(d: d, firstChild: tmp!, secondChild: s!, newK: tmp!.K[d])
            }
        } else {
            let s = root?.insertNode(value: data, isRoot: true)
            if s != nil{
                root = s
            }
        }
    }
}
