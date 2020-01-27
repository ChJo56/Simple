import UIKit
import Combine



//let _ = Just(5)
//    .map { value -> String in
//        switch value {
//        case _ where value < 1:
//            return "none"
//        case _ where value == 1:
//            return "one"
//        case _ where value == 2:
//            return "couple"
//        case _ where value == 3:
//            return "few"
//        case _ where value > 8:
//            return "many"
//        default:
//            return "some"
//        }
//
//}
//.sink { receivedValue in
//    print("The end result was \(receivedValue)")
//}

let helloPublisher = "Hello world!".publisher
let fibPublisher = [0, 1, 2, 3, 4].publisher
_ = fibPublisher.sink(receiveCompletion: { (completion) in
   switch completion {
   case .finished:
       print("Finished!")
   case .failure(let never):
       print(never)
   }
}, receiveValue: { (value) in
   print(value)
})
//
//let subscriber = fibPublisher.sink { (value) in
//    print(value)
//}
//subscriber.cancel()
//
//let passThroughSubject = PassthroughSubject<String,Never>()
//passThroughSubject.send("Hello")
//passThroughSubject.send("World")
//
//passThroughSubject.sink(receiveValue: { value in
//    print(value)
//})
//passThroughSubject.send("Hello world!")
//
//let current = CurrentValueSubject<String,Error>("1")
//
//current.send("Most Recent Value is 20")
//
//current.sink(receiveCompletion: { (completion) in
//    switch completion {
//      case .finished:
//          print("Finished!")
//      case .failure(let never):
//          print(never)
//      }
//}) { (value) in
//    print(value)
//}
//
//
////let helloPublisher = "Hello world!".publisher
////let fibPublisher = [0, 1, 2, 3, 4].publisher
//
//fibPublisher.map {
//    return $0 * 10
//}.sink(receiveCompletion: { (completion) in
//    switch completion {
//        case .finished:
//            print("Finished!")
//        case .failure(let never):
//            print(never)
//        }
//}) { (value) in
//    print(value)
//}
//
//helloPublisher.map {
//    $0.uppercased()
//}.sink(receiveCompletion: { (completion) in
//    switch completion {
//    case .finished:
//        print("Finished!")
//    case .failure(let never):
//        print(never)
//    }
//}) { (value) in
//    print(value)
//}
//
//
////0, 1, 2, 3, 4
//fibPublisher.scan(1) { seed, value in
//    return seed + value
//}.sink { (value) in
//    print(value)
//}
//
//let fibonacciPublisher = [10, 11, 22, 33, 44].publisher
//
//fibonacciPublisher.filter {
//    $0 > 20
//}.sink { (value) in
//    print(value)
//}

//struct NewPost {
//    var title: String
//    var description: String
//}
//
//let newPostPublisher = NotificationCenter.Publisher(center: .default, name: .newPostObject, object: nil)
//    .map {(notification) -> String? in
//        return (notification.object as? NewPost)?.title ?? ""
//
//}
//
//let newPostSubscriber = Subscribers.Assign(object: .newPostCreatedLabel, keyPath: \.text)
//newPostPublisher.subscribe(newPostSubscriber)

//
//let sequencePublisher = [1, 2, 3, 4, 5].publisher
//let subscription = sequencePublisher.sink { (value) in
//    print(value)
//}

//let germanCities = PassthroughSubject<String,Never>()
//let italianCities = PassthroughSubject<String,Never>()
//let europeanCities = Publishers.Merge(germanCities, italianCities)
//_ = europeanCities.sink(receiveValue: { (city) in
//    print("\(city) is in Europe!")
//})
//
//germanCities.send("Munich")
//germanCities.send("Berlin")
//italianCities.send("Milano")
//italianCities.send("Rome")
//
//let selectedFilter = PassthroughSubject<String, Never>()
//let searchText = PassthroughSubject<String, Never>()

//let publisher = Publishers.CombineLatest(selectedFilter, searchText, transform: { selectedFilter, searchText in
//    "\()"
////})
//
//let sequencePublisher = Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3, 4, 5])
////       let subscription = sequencePublisher.sink { (value) in
////           print(value)
////       }
//let subscriber = sequencePublisher.sink(receiveCompletion: { (_) in
//    print("Finished!!")
//}) { (value) in
//    print(value)
//}
//subscriber.cancel()
//
//let subject = PassthroughSubject<String,Never>()
//let publisher = subject.eraseToAnyPublisher()
//
//let subscriber1 = publisher.sink { (value) in
//    print(value)
//}
//subject.send("Event1")
//subject.send("Event2")
//
//let subscriber2 = publisher.sink { (value) in
//    print(value)
//}
//subject.send("Event3")

//_ = Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3, 3, 3, 3, 4, 4])
//    .map{ $0 * 10 }
//    .dropFirst(1)
//    .removeDuplicates()
//    .sink( receiveValue: { (value) in
//        print(value)
//    })

//
//let selectedFilter = PassthroughSubject<String, Never>()
//let searchText = PassthroughSubject<String, Never>()

//let publisher = Publishers.CombineLatest(selectedFilter,searchText, transform: { selectedFilter, searchText in
//    "\(selectedFilter) \(searchText)"
//})
//
//_ = publisher.sink { value in
//    print(value)
//}

//_ = Publishers.Sequence(sequence: [1,2,3,4,5])
//.scan(1, +)
//.sink(receiveValue: { value in
//    print(value)
//})

struct Item: Equatable {
    var name: String?
    var quantity: NSNumber?
    var id: NSNumber?
}

func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name
        && lhs.quantity == rhs.quantity
        && lhs.id == rhs.id
}

class ItemsSingleton: NSObject{
    static let sharedInstance = ItemsSingleton()
    var items = [Item(name:"Item 1", quantity: NSNumber(value: 2), id: NSNumber(value: 1)),
                 Item(name:"Item 2", quantity: NSNumber(value: 3), id: NSNumber(value: 2)),
                 Item(name:"Item 3", quantity: NSNumber(value: 5), id: NSNumber(value: 3)),
                 Item(name:"Item 4", quantity: NSNumber(value: 8), id: NSNumber(value: 4)),
                 Item(name:"Item 5", quantity: NSNumber(value: 10), id: NSNumber(value: 5)),
                 Item(name:"Item 6", quantity: NSNumber(value: 3), id: NSNumber(value: 6)),
                 Item(name:"Item 7", quantity: NSNumber(value: 1), id: NSNumber(value: 7)),
                 Item(name:"Item 8", quantity: NSNumber(value: 2), id: NSNumber(value: 8))]

     //let result = items.filter({$0.id == Any})
    func getObjectIndex(id: NSNumber?) -> Int?{
        if let id = id{
            let result = items.filter({$0.id == id})
            print(result)
            if result.count == 0 {
                return nil
            }
            let index = items.firstIndex(of: result.first!)
            print(index!)
            return index
        }
        return nil
    }
}

ItemsSingleton.sharedInstance.getObjectIndex(id: 5)

let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
print(inverseSet)

//2007-10
//2009-Inter
//2013-Bachelors
//2015-Masters
