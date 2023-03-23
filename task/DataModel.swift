//
//  DataModel.swift
//  task
//
//  Created by Даша Волошина on 13.03.23.
//

import Foundation
import CoreData

class PersistenceController: ObservableObject {
    
    static let shared = PersistenceController()
    var context: NSManagedObjectContext {return persistentContainer.viewContext}
    let persistentContainer: NSPersistentContainer
    @Published var users: [User] = []
    
     init() {
        persistentContainer = NSPersistentContainer(name: "UserModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
            
        }
        fetchRequest()
    }
    func fetchRequest() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            users = try persistentContainer.viewContext.fetch(request)
        }
        catch let error {
            print("error")
        }
        
    }
    func addUser(email:String, firstName:String, lastName:String) {
        let user = User(context: context)
        user.email = email
        user.firstName = firstName
        user.lastName = lastName
        saveContext()
        //        users.append(user)
        
        
        //        PersistenceController.shared.saveContext()
        
    }
    
    
    func saveContext () {
        
        do {
            try context.save()
            fetchRequest()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
    
//    func getTaskById(id: NSManagedObjectID) -> User? {
//
//           do {
//               return try context.existingObject(with: id) as? User
//           } catch {
//               return nil
//           }
//
//       }
//
//    func deleteTask(user: User) {
//
//        context.delete(user)
//        saveContext()
//
//    }
//
//    func getAllUsers() -> [User] {
//
//        let request: NSFetchRequest<User> = User.fetchRequest()
//
//        do {
//            return try context.fetch(request)
//        } catch {
//            return []
//        }
//
//    }
//
//}

extension NSManagedObject {
    convenience init(context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }
}

