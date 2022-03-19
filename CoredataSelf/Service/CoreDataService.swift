//
//  CoreDataService.swift
//  CoredataSelf
//
//  Created by Kyungyun Lee on 19/03/2022.
//

import Foundation
import CoreData

class CoreDateService {
    
    static let shared = CoreDateService()
    
    let container : NSPersistentContainer
    let context : NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error to make container!")
            }
        }
        context = container.viewContext // 초기화 하면서 코어데이터의 파일을 지정해주고, 안의 텍스트 객체를 생성한다.
    }
    
    func save() { // 데이터를 코어데이터 모델에 세이브한다.
        do {
            try context.save()
        } catch {
            print("error saving = \(error)")
        }
    }
    
}
