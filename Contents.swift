import UIKit

class LinkNode{
    var value:Int
    var NN:LinkNode?
    var PN: LinkNode?
    
    init(value: Int){
        self.value = value
    }
}
class LRU {
    let max = 3
    var head : LinkNode?
    var tail : LinkNode?
    
    var hashT:[Int: LinkNode] = [:]
    
    var search: LinkNode?
    var prev: LinkNode?
    var nxt: LinkNode?
    
    func Get (_ value:Int)->Int?{
        
        search = hashT[value]
        
        if search?.NN != nil{
        prev = search?.PN
        nxt = search?.NN
        
        prev?.NN = nxt
        nxt?.PN = prev
        
        if nxt?.PN == nil{
            tail = nxt
            }
        
        search?.PN = head
        search?.NN = nil
        head = search
        
        }
        
        return search?.value
    }
    
    func Put(_ value:Int) ->Void{
        let NewNode: LinkNode = LinkNode(value:value)
        
        
        if hashT.count == 0{
            head = NewNode
            tail = NewNode
        }
        
        NewNode.PN = head
        head?.NN = NewNode
        head = NewNode
        hashT[value] = NewNode
        
        if hashT.count > max{
            let x = tail?.value
            tail?.NN?.PN = nil
            hashT.removeValue(forKey: x!)
            tail = tail?.NN
        }
        
    }
}


var test = LRU()

test.Put(1)
print(test.hashT.count)
test.Put(2)
print(test.hashT.count)
test.Put(3)
print(test.hashT.count)
test.Put(4)
print(test.hashT.count)

print(test.head?.value)
print(test.tail?.value)

test.Get(2)

print(test.head?.value)
print(test.tail?.value)



