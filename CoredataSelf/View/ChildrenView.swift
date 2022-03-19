//
//  ChildrenView.swift
//  CoredataSelf
//
//  Created by Kyungyun Lee on 19/03/2022.
//


import SwiftUI

struct ChildrenView: View {
    
    let folder : FolderEntity
    
    @State var contentName : String = ""
    @StateObject var vm = CoreDataViewModel()
    
    let coreDataService = CoreDateService.shared
    
    var body: some View {
        NavigationView{
                VStack{
                    TextField("enter Data", text: $contentName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button("Save".uppercased()) {
                        vm.addContent(name: contentName ?? "noname", content: "hi", folder: folder)
                    }
                    .padding(.trailing, 16)
                    
                    List {
                        ForEach(vm.contents.filter({$0.folders == folder})) { content in
                            ChildrenListRowView(content: content)
                        }
                        .onDelete { indexSet in
                            vm.deleteChildren(indexSet: indexSet)
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("CoreData Self")
            }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
