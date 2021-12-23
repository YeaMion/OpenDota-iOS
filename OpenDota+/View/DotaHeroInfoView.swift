//
//  DotaHeroInfoView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/14.
//

import Kingfisher
import SwiftUI

struct DotaHeroInfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dotaData: DotaData
    var dotaHero: DotaHeroModel

    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    KFImage(URL(string: "https://dotabase.dillerm.io/dota-vpk/panorama/images/heroes/selection/" + dotaHero.name + "_png.png")!)
                        .placeholder { Image("item_placeholder").resizable().frame(width: 71, height: 94, alignment: .center).scaledToFill() }
                        .resizable()
                        .frame(width: 71, height: 94, alignment: .leading)
                        .scaledToFill()
                        .cornerRadius(4)
                        .shadow(radius: 10)
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 18)
                .padding(.bottom, 12)
                
                HStack {
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .padding(.bottom, 4)
                    Spacer()
                }
                       
                HStack {
                    Text("notenotenotenotenotenote")
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .padding(.bottom, 4)
                        .foregroundColor(Color(red: 34/255.0, green: 156/255.0, blue: 34/255.0))
                        .font(.system(size: 14))
                    Spacer(minLength: 0)
                }
                        
                VStack {
                    HStack {
                        Text("attrattr")
                        Text("footer")
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .font(.system(size: 14))
                    .opacity(0.7)
                }
                        
                HStack {
                    Image("aaaa")
                        .resizable()
                        .frame(width: 11, height: 11, alignment: .center)
                        .cornerRadius(2)
                    Text("aa").font(.system(size: 14))
                        
                    Image("aaaa")
                        .resizable()
                        .frame(width: 11, height: 11, alignment: .center)
                        .cornerRadius(2)
                    Text("aa").font(.system(size: 14))
                    Spacer()
                }
                .padding(.leading, 20)
                
                HStack { Text("lorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlorlor")
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                    .opacity(0.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 4, style: .continuous).fill(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                    )
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .redacted(reason: .placeholder).shimmering()
            .navigationBarTitle(dotaHero.localized_name ?? "Unknown")
        }
    }
}
