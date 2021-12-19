//
//  DotaItemCelll.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/7.
//

import Kingfisher
import SwiftUI

struct DotaItemRow: View {
    var dotaItem: DotaItemModel

    var body: some View {
        HStack {
            // https://steamcdn-a.akamaihd.net
            KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com" + dotaItem.img)!)
                .placeholder { Image("item_placeholder").resizable().frame(width: 43, height: 33, alignment: .center).scaledToFill() }
                .resizable()
                .frame(width: 43, height: 33, alignment: .leading)
                .cornerRadius(4)
                .scaledToFill()

            Text(dotaItem.dname ?? "Unknown")
                .font(.system(size: 14))
                .lineLimit(1)
            Spacer()
        }
    }
}

struct DotaItemCelll_Previews: PreviewProvider {
    static var previews: some View {
        DotaItemRow(dotaItem: dotaItemsData[0])
    }
}
