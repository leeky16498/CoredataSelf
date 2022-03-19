//
//  CoredataViewModel.swift
//  CoredataSelf
//
//  Created by Kyungyun Lee on 19/03/2022.
//

import Foundation
import CoreData

class CoreDataViewModel : ObservableObject {
    
    @Published var folders : [FolderEntity] = []
    @Published var contents : [ContentEntity] = []
    
    let coreDataService = CoreDateService.shared
    
    init() {
        getFolders()
        getContents()
    }
    
    func addFolder(name : String) {
        
        let newFolder = FolderEntity(context: coreDataService.context)
        newFolder.name = name
        coreDataService.save()
        getFolders()
        
    }
    
    func addContent(name : String, content : String, folder : FolderEntity) {
        
        let newMemo = ContentEntity(context: coreDataService.context)
        newMemo.name = name
        newMemo.content = content
        newMemo.folders = folder
        coreDataService.save()
        getContents()
        
    }
    
    func deleteFolder(indexSet : IndexSet) {
        guard let index = indexSet.first else {return}
        let folder = folders[index]
        coreDataService.context.delete(folder)
        coreDataService.save()
        getFolders()
    }
    
    func deleteChildren(indexSet : IndexSet) {
        guard let index = indexSet.first else {return}
        let content = contents[index]
        coreDataService.context.delete(content)
        coreDataService.save()
        getContents()
    }
    
    func getFolders() {
        
        let request = NSFetchRequest<FolderEntity>(entityName: "FolderEntity")
        
        do {
            folders = try coreDataService.context.fetch(request)
        } catch {
            fatalError("Error fetching data")
        }
    }
    
    func getContents () {
        
        let request = NSFetchRequest<ContentEntity>(entityName: "ContentEntity")
        
        do {
            contents = try coreDataService.context.fetch(request)
        } catch {
            fatalError("Error fetching data")
        }
    }
    
    func updateFolder(folder : FolderEntity) {
        folder.name = "New Folder Name"
        coreDataService.save()
        getFolders()
    }
}
