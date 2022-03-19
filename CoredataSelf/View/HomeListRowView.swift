//
//  ListRowView.swift
//  CoredataSelf
//
//  Created by Kyungyun Lee on 19/03/2022.
//

import SwiftUI

struct HomeListRowView: View {
    
    let folder : FolderEntity
    
    var body: some View {
        HStack{
            NavigationLink(destination: {
            ChildrenView(folder: folder)
            }, label: {
                Text(folder.name ?? "No name")
            })
        }
            
        }
}
//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView()
//    }
//}
