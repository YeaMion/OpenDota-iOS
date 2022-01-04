//
//  DotaItemsView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/7.
//

import SwiftUI

struct DotaItemsView: View {
    @EnvironmentObject var dotaData: DotaData
    @State private var searchString = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dotaData.dotaItemsList) { doItem in
                    // if doItem.qual != nil {
                    NavigationLink(destination: DotaItemInfoView(dotaItem: doItem)) {
                        DotaItemRow(dotaItem: doItem)
                    }
                    // }
                }
            }
            .searchable(text: $searchString)
            .navigationTitle("Items")
            .navigationBarTitle("Items")
        }
    }
}
