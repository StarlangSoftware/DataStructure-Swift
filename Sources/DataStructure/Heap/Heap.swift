//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.10.2022.
//

import Foundation

public class Heap<T : Comparable>{
    
    var array: [HeapNode<T>] = []
    var count: Int = 0
    
    public init(N: Int){
    }
    
    public func isEmpty()->Bool{
        return count == 0
    }
    
    public func swapNode(index1: Int, index2: Int){
        let tmp = array[index1]
        array[index1] = array[index2]
        array[index2] = tmp
    }
    
    public func compare(data1: T, data2: T)-> Bool{
        return data1 < data2
    }
    
    private func percolateDown(n: Int){
        var no : Int = n
        var left : Int = 2 * no + 1
        var right : Int = 2 * no + 2
        while ((left < count && compare(data1: array[no].getData(), data2: array[left].getData())) ||
               (right < count && compare(data1: array[no].getData(), data2: array[right].getData()))){
            if (right >= count || !compare(data1: array[left].getData(), data2: array[right].getData())){
                swapNode(index1: no, index2: left)
                no = left
            } else {
                swapNode(index1: no, index2: right)
                no = right
            }
            left = 2 * no + 1
            right = 2 * no + 2
        }
    }
    
    private func percolateUp(n: Int){
        var no : Int = n
        var parent : Int = (no - 1) / 2
        while (parent >= 0 && compare(data1: array[parent].getData(), data2: array[no].getData())){
            swapNode(index1: parent, index2: no)
            no = parent
            parent = (no - 1) / 2
        }
    }
    
    public func delete()-> T{
        let tmp = array[0]
        array[0] = array[count - 1]
        percolateDown(n: 0)
        count = count - 1
        return tmp.getData()
    }
    
    public func insert(data: T){
        if count <= array.count{
            array.append(HeapNode<T>(data: data))
            count = count + 1
        } else {
            count = count + 1
            array[count - 1] = HeapNode<T>(data: data)
        }
        percolateUp(n: count - 1)
    }

}
