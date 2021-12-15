//
//  DotaItemsView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/7.
//

import SwiftUI

struct DotaItemsView: View {
    @EnvironmentObject var dotaData: DotaData

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
            .ignoresSafeArea()
            .navigationTitle("Items")
            .navigationBarTitle("Items")
        }
    }
}

struct DotaItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DotaItemsView()
        }
        .environmentObject(DotaData())
    }
}
