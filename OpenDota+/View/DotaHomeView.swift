//
//  DotaHomeView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/19.
//

import Kingfisher
import SwiftUI

struct DotaHomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    HStack {
                        Text("Recent")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 20)
                    ScrollView(.horizontal) {
                        HStack(alignment: .top, spacing: 0, content: {
                            Spacer(minLength: 12)
                                .frame(width: 12, height: 12)
                            HStack {
                                VStack(alignment: .leading) {
                                    Spacer(minLength: 0)
                                    HStack {
                                        Text("HOODWINK")
                                            .font(.system(size: 14))
                                            .bold()
                                        Text("W")
                                            .font(.system(size: 8))
                                            .frame(width: 12, height: 12, alignment: .center)
                                            .background(.green)
                                            .cornerRadius(2)
                                    }
                                    Text("K/D/A: 12/2/4")
                                        .font(.system(size: 12))
                                        .opacity(0.9)
                                    Text("L/D: 321/16")
                                        .font(.system(size: 11))
                                        .opacity(0.9)
                                    Spacer(minLength: 0)
                                    Text("45 mins ago")
                                        .font(.system(size: 10))
                                        .opacity(0.5)
                                        .padding(.bottom, 2)
                                }
                                .padding(.top, 8)
                                .padding(.leading, 12)

                                Spacer(minLength: 170)
                            }
                            .frame(width: 320, height: 105, alignment: .bottom)
                            .background(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                            .cornerRadius(6)
                            .overlay(
                                KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/crops/hoodwink.png")!)
                                    .resizable()
                                    .frame(width: 180, height: 120, alignment: .center)
                                    .cornerRadius(6),
                                alignment: .bottomTrailing)
                            .padding(.leading, 6)

                            HStack {
                                VStack(alignment: .leading) {
                                    Spacer(minLength: 0)
                                    HStack {
                                        Text("Juggernaut")
                                            .font(.system(size: 14))
                                            .bold()
                                        Text("L")
                                            .font(.system(size: 8))
                                            .frame(width: 12, height: 12, alignment: .center)
                                            .background(.red)
                                            .cornerRadius(2)
                                    }
                                    Text("K/D/A: 16/9/7")
                                        .font(.system(size: 12))
                                        .opacity(0.9)
                                    Text("L/D: 456/21")
                                        .font(.system(size: 11))
                                        .opacity(0.9)
                                    Spacer(minLength: 0)
                                    Text("2 hours ago")
                                        .font(.system(size: 10))
                                        .opacity(0.5)
                                        .padding(.bottom, 2)
                                }
                                .padding(.top, 8)
                                .padding(.leading, 12)

                                Spacer(minLength: 170)
                            }
                            .frame(width: 320, height: 105, alignment: .bottom)
                            .background(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                            .cornerRadius(6)
                            .overlay(
                                KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/crops/juggernaut.png")!)
                                    .resizable()
                                    .frame(width: 180, height: 120, alignment: .center)
                                    .cornerRadius(6),
                                alignment: .bottomTrailing)
                            .padding(.leading, 6)

                            HStack {
                                VStack(alignment: .leading) {
                                    Spacer(minLength: 0)
                                    HStack {
                                        Text("Jakiro")
                                            .font(.system(size: 14))
                                            .bold()
                                        Text("W")
                                            .font(.system(size: 8))
                                            .frame(width: 12, height: 12, alignment: .center)
                                            .background(.green)
                                            .cornerRadius(2)
                                    }
                                    Text("K/D/A: 4/8/24")
                                        .font(.system(size: 12))
                                        .opacity(0.9)
                                    Text("L/D: 125/4")
                                        .font(.system(size: 11))
                                        .opacity(0.9)
                                    Spacer(minLength: 0)
                                    Text("3 days ago")
                                        .font(.system(size: 10))
                                        .opacity(0.5)
                                        .padding(.bottom, 2)
                                }
                                .padding(.top, 8)
                                .padding(.leading, 12)

                                Spacer(minLength: 170)
                            }
                            .frame(width: 320, height: 105, alignment: .bottom)
                            .background(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                            .cornerRadius(6)
                            .overlay(
                                KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/crops/jakiro.png")!)
                                    .resizable()
                                    .frame(width: 180, height: 120, alignment: .center)
                                    .cornerRadius(6),
                                alignment: .bottomTrailing)
                            .padding(.leading, 6)
                            
                            Spacer(minLength: 12)
                                .frame(width: 12, height: 12)
                        })
                            .frame(width: .infinity, height: 128)
                    }
                }
            }
            .navigationTitle("Dota")
        }
    }
}

struct DotaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DotaHomeView()
    }
}
