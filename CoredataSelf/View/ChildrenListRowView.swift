//
//  ChildrenListRowView.swift
//  CoredataSelf
//
//  Created by Kyungyun Lee on 19/03/2022.
//


import SwiftUI

struct ChildrenListRowView: View {
    
    let content : ContentEntity
    
    var body: some View {
        
        HStack{
            Text(content.name ?? "noname_01")
            Spacer()
            Text(content.content ?? "no content")
        }
    }
}
