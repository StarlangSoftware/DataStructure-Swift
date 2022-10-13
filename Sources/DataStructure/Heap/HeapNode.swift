//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.10.2022.
//

import Foundation

public class HeapNode<T>{
    
    var data: T
    
    public init(data: T){
        self.data = data
    }
    
    public func getData()-> T{
        return self.data
    }
}
