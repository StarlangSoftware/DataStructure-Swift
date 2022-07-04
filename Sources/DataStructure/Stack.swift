//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 4.07.2022.
//

import Foundation

public class Stack<T>{
    
    private var list: [T]
    
    public init(){
        list = []
    }
    
    public func push(item: T){
        list.append(item)
    }
    
    public func pop() -> T?{
        if (list.count > 0){
            return list.popLast()!
        } else {
            return nil
        }
    }
    
    public func isEmpty() -> Bool{
        return list.isEmpty
    }

}
