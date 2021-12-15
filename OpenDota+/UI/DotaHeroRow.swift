//
//  DotaHeroRow.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/11.
//

import SwiftUI
import Kingfisher

struct DotaHeroRow: View {
    var dotaHero: DotaHeroModel

    var body: some View {
        HStack {
            // https://steamcdn-a.akamaihd.net
            KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com" + dotaHero.img)!)
                .placeholder { Image("item_placeholder").resizable().scaledToFill().frame(width: 64, height: 36, alignment: .center) }
                .resizable()
                .frame(width: 64, height: 36, alignment: .leading)
                .cornerRadius(4)
                .scaledToFill()

            Text(dotaHero.localized_name ?? "Unknown")
                .font(.system(size: 14))
                .lineLimit(1)
            Spacer()
        }
    }
}
