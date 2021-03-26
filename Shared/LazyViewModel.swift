//
//  LazyViewModel.swift
//  LazyView
//
//  Created by Jakub Kozlowicz on 26.03.21.
//

import Foundation
import SwiftUI


class LazyViewModel: ObservableObject {
    @Published var isLoadingGroups: Bool = true
    @Published var groups = [MyGroup]()
    @Published var groupItems = [UUID: [MyGroupItem]]()
    
    static let groupIds = [UUID(), UUID(), UUID(), UUID(), UUID(), UUID()]
    static let groupTitles = ["Dogs", "Cats", "Dinosaurs", "Birds", "Snakes", "Reptiles"]
    
    
    func fetchGroups() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation {
                self.groups = zip(LazyViewModel.groupIds, LazyViewModel.groupTitles).map { MyGroup(id: $0.0, title: $0.1 )}
                self.isLoadingGroups = false
            }
        }
    }
    
    func fetchGroupItems(group: MyGroup) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation {
                let items = [
                    MyGroupItem(id: UUID(), title: "Ralph", description: "My best friend", image: "icons8-dog_walking"),
                    MyGroupItem(id: UUID(), title: "Tom", description: "The cat", image: "icons8-cat_head"),
                    MyGroupItem(id: UUID(), title: "Jerry", description: "The mouse", image: "icons8-mouse_animal"),
                    MyGroupItem(id: UUID(), title: "Simba", description: "The lion", image: "icons8-lion"),
                    MyGroupItem(id: UUID(), title: "Chebbaca", description: "Rawr", image: "icons8-lion"),
                    MyGroupItem(id: UUID(), title: "Rex", description: "You better run", image: "icons8-dinosaur_egg"),
                    MyGroupItem(id: UUID(), title: "Golden retriever", description: "Loves to eat", image: "icons8-dog_park"),
                ]
                
                let randomNumberOfItems = Int.random(in: (0...items.count - 1))
                self.groupItems[group.id] = Array(items[0...randomNumberOfItems])
            }
        }
    }
}
