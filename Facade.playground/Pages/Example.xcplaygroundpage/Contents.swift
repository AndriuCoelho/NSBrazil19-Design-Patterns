import Foundation
import UIKit


// MARK: - SISTEMA DE PEDIDOS

//
//
//
// MARK: - ESTRUTURAS ENVOLVIDAS
//
//
//

struct Item: Hashable {
    
    let sku: String
    let name: String
    let color: UIColor
    let brand: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(sku)
    }
}

struct Address {
    
    let line: String
    let number: String
    let city: String
}

struct Client {
    
    let doc: String
    let name: String
    let address: Address
}


//
//
//
// MARK: - Classes envolvidas
//
//
//


final class Inventory {
    
    private var store: [Item: Int] = [:]
    
    func add(_ item: Item) {
        if var storedItem = store[item] {
            storedItem += 1
        } else {
            store[item] = 1
        }
    }
    
    func get(_ sku: String) -> Item? {
        
        let possibleItemKey = store.keys.first(where: { $0.sku == sku })
        
        guard let item = possibleItemKey else {
           return nil
        }
        
        store[item] = store[item]! > 1 ? store[item]! - 1 : nil
        
        return item
    }
}

final class ClientSession {
    
    private(set) var client = Client(doc: "12345678-9",
                                     name: "Vinicius Campos Garcia",
                                     address: Address(line: "One Apple Park Way",
                                                      number: "Any number",
                                                      city: "Cupertino"))
}

typealias TrackingCode = String
final class Shipping {
    func send(item: Item, to client: Client) -> TrackingCode {
        print("sending: \(item.sku) to \(client.name)")
        return "BR489372489SV"
    }
}

//
//
//
// MARK: - Quem consome?
//
//
//


final class ViewController {
    
    enum OrderStatus {
        case ordered(TrackingCode)
        case outOfStock
    }
    
    private let inventory: Inventory
    private let clientSession: ClientSession
    private let shipping: Shipping
    
    init(inventory: Inventory,
         clientSession: ClientSession,
         shipping: Shipping) {
        
        self.inventory = inventory
        self.clientSession = clientSession
        self.shipping = shipping
    }
    
    private func makeOrder(_ sku: String) -> OrderStatus {
        
        let client = clientSession.client
        
        guard let item = inventory.get(sku) else {
            return .outOfStock
        }
        
        let trackingCode = shipping.send(item: item, to: client)
        
        return .ordered(trackingCode)
    }
}

final class ViewController1 {
    
    enum OrderStatus {
        case ordered(TrackingCode)
        case outOfStock
    }
    
    private let inventory: Inventory
    private let clientSession: ClientSession
    private let shipping: Shipping
    
    init(inventory: Inventory,
         clientSession: ClientSession,
         shipping: Shipping) {
        
        self.inventory = inventory
        self.clientSession = clientSession
        self.shipping = shipping
    }
    
    private func makeOrder(_ sku: String) -> OrderStatus {
        
        let client = clientSession.client
        
        guard let item = inventory.get(sku) else {
            return .outOfStock
        }
        
        let trackingCode = shipping.send(item: item, to: client)
        
        return .ordered(trackingCode)
    }
}


//
//
//
// MARK: - O FACADE
//
//
//

enum OrderStatus {
    case ordered(TrackingCode)
    case outOfStock
}

protocol OrderFacadeProtocol {
    func makeOrder(sku: String) -> OrderStatus
}

final class OrderFacade: OrderFacadeProtocol {
    
    private let inventory: Inventory
    private let clientSession: ClientSession
    private let shipping: Shipping
    
    init(inventory: Inventory,
         clientSession: ClientSession,
         shipping: Shipping) {
        
        self.inventory = inventory
        self.clientSession = clientSession
        self.shipping = shipping
    }
    
    func makeOrder(sku: String) -> OrderStatus {
        
        let client = clientSession.client
        
        guard let item = inventory.get(sku) else {
            return .outOfStock
        }
        
        let trackingCode = shipping.send(item: item, to: client)
        
        return .ordered(trackingCode)
    }
}

//
//
//
// MARK: - Quem consome?
//
//
//


final class ViewController2{
    
    private let orderFacade: OrderFacadeProtocol
    
    init(orderFacade: OrderFacadeProtocol) {
        self.orderFacade = orderFacade
    }
    
    func makeOrder(sku: String) {
        orderFacade.makeOrder(sku: sku)
    }
}

final class ViewController3 {
    
    private let orderFacade: OrderFacadeProtocol
    
    init(orderFacade: OrderFacadeProtocol) {
        self.orderFacade = orderFacade
    }
    
    func makeOrder(sku: String) {
        orderFacade.makeOrder(sku: sku)
    }
}
