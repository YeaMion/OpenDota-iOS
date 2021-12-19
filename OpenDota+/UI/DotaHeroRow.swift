//
//  DotaHeroRow.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/11.
//

import SwiftUI
import Kingfisher

struct DotaHeroRow: View {
    @Environment(\.colorScheme) var colorScheme
    var dotaHero: DotaHeroModel

    var body: some View {
        HStack {
            // https://steamcdn-a.akamaihd.net
            // 竖直头像Url: https://dotabase.dillerm.io/dota-vpk/panorama/images/heroes/selection/{dotaHero.name}_png.png
            KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com" + dotaHero.img)!)
                .placeholder { Image("item_placeholder").resizable().scaledToFill().frame(width: 64, height: 36, alignment: .center).scaledToFill() }
                .resizable()
                .frame(width: 64, height: 36, alignment: .leading)
                .cornerRadius(4)
                .scaledToFill()

            Text(dotaHero.localized_name ?? "Unknown")
                .font(.system(size: 14))
                .lineLimit(1)
            Spacer()
            if dotaHero.attack_type == "Ranged" {
                Image(colorScheme == .dark ? "hero_ranged_dark" : "hero_ranged_light")
                    .resizable()
                    .frame(width: 18, height: 18, alignment: .center)
                    .padding(.trailing, 8)
                    .opacity(0.7)
            }
            else if dotaHero.attack_type == "Melee" {
                Image(colorScheme == .dark ? "hero_melee_dark" : "hero_melee_light")
                    .resizable()
                    .frame(width: 18, height: 18, alignment: .center)
                    .padding(.trailing, 8)
                    .opacity(0.7)
            }
        }
    }
}
