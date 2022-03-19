//
//  HomeView.swift
//  CoredataSelf
//
//  Created by Kyungyun Lee on 19/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var dataName : String = ""
    @StateObject var vm = CoreDataViewModel()
    
    let coreDataService = CoreDateService.shared
    
    var body: some View {
        NavigationView{
                VStack{
                    TextField("enter Data", text: $dataName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button("Save".uppercased()) {
                        vm.addFolder(name: dataName)
                    }
                    .padding(.trailing, 16)
                    
                    List {
                        ForEach(vm.folders) { folder in
                            HomeListRowView(folder: folder)
                                .onTapGesture {
                                    vm.updateFolder(folder: folder)
                                }
                        }
                        .onDelete(perform: vm.deleteFolder)
                    }
                    .listStyle(.plain)

                }
                .navigationTitle("CoreData Self")
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
