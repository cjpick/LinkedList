//: Playground - noun: a place where people can play

import Foundation

class LinkedList<A> {
    
    let value:A
    var next:LinkedList<A>?
    
    init(_ value:A, next:LinkedList<A>? = nil) {
        self.value = value
        self.next = next
    }
    
    func appendedToStart(_ value:A)->LinkedList<A> {
        return appendedToStart(LinkedList(value))
    }
    
    func appendedToStart(_ link:LinkedList<A>)->LinkedList<A> {
        link.next = self
        return link
    }
    
    func appendToTail(_ value:A) {
        appendToTail(LinkedList(value))
    }
    
    func appendToTail(_ link:LinkedList<A>) {
        if let next = next {
            next.appendToTail(link)
        } else {
            next = link
        }
    }
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        let rest: String
        if let next = next {
            rest = ", \(next)"
        } else {
            rest = ""
        }
        return "\(value)\(rest)"
    }
}

var list = LinkedList("First")
list.appendToTail("Second")
list = list.appendedToStart("Third")
