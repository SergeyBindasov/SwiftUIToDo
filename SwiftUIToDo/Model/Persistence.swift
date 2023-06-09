//
//  Persistence.swift
//  SwiftUIToDo
//
//  Created by Sergey on 29.05.2023.
//

import CoreData

struct PersistenceController {
    // MARK: - 1. PRESISTENCE CONTROLLER
    static let shared = PersistenceController()
    // MARK: - 2. PRESISTENCE CONTAINER
    let container: NSPersistentContainer
    // MARK: - 3. INIT
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SwiftUIToDo")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
// MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task  No\(i)"
            newItem.complition = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
