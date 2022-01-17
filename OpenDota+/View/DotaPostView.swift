//
//  DotaHomeView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/19.
//

import Kingfisher
import SwiftUI

struct DotaPostView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dotaData: DotaData
    @State var currentIndex: Int = 0

    @State var values: [Double] = [500, 320]
    var colors: [Color] = [Color.green, Color.red]

    // 更新日志ViewModel
    @StateObject var patchVM = PatchesViewModel()

    @State var firstFetchPatches: Bool = true

    @State var showSetting = false
    @State var showSearch = false

    @State private var appearanceIndex = 0
    @State private var startpageIndex = 0
    var appearanceOptions = ["Auto", "Dark", "Light"]
    var startpageOptions = ["Heroes", "Items", "Dota"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Divider()
                        .padding(.leading, 20)
                        .padding(.trailing, 20)

                    ZStack {
                        // 分段
                        HStack {
                            Spacer()
                            ZStack {
                                KFImage(URL(string: "https://www.opendota.com/assets/images/dota2/rank_icons/rank_icon_3.png")!)
                                    .resizable()
                                    .frame(width: 92, height: 92, alignment: .center)
                                KFImage(URL(string: "https://www.opendota.com/assets/images/dota2/rank_icons/rank_star_4.png")!)
                                    .resizable()
                                    .frame(width: 92, height: 92, alignment: .center)
                            }
                            .mask(
                                LinearGradient(gradient:
                                    Gradient(colors: [Color.black.opacity(0), Color.black]), startPoint: .leading, endPoint: .trailing)
                                    .frame(width: 92)
                            )
                            .padding(.trailing, 20)
                        }

                        // 头像、昵称
                        HStack(alignment: .center) {
                            KFImage(URL(string: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/2c/2ceeded15edf102e999eeb24ffc9f91789b8fd0a_full.jpg")!)
                                .placeholder { Image("avatar_placeholder").resizable().frame(width: 56, height: 56, alignment: .center).scaledToFill() }
                                .resizable()
                                .frame(width: 56, height: 56, alignment: .center)
                                .cornerRadius(28)
                                .padding(.trailing, 8)
                            VStack(alignment: .leading) {
                                Text("shockjockey")
                                    .bold()
                                    .font(.custom("Reaver-Bold", size: 26))
                                    .lineLimit(1)

                                Text("ID: 234359087")
                                    .font(.custom("Radiance", size: 16))
                                    .lineLimit(1)
                                    .opacity(0.7)
                            }
                            Spacer()
                        }
                        .padding(.leading, 20)
                        // .padding(.bottom, 8)
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            Spacer(minLength: 4)

                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height: 60)
                                    .foregroundColor(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text("UNKNOWN")
                                        .font(.custom("Radiance-SemiBold", size: 18))
                                        .padding(.top, 4)
                                        .opacity(0.8)

                                    Text("UNKNOWN")
                                        .font(.custom("Radiance", size: 14))
                                }
                            }

                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height: 60)
                                    .foregroundColor(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text("UNKNOWN")
                                        .font(.custom("Radiance-SemiBold", size: 18))
                                        .padding(.top, 4)
                                        .opacity(0.8)

                                    Text("UNKNOWN")
                                        .font(.custom("Radiance", size: 14))
                                }
                            }

                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height: 60)
                                    .foregroundColor(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text("UNKNOWN")
                                        .font(.custom("Radiance-SemiBold", size: 18))
                                        .padding(.top, 4)
                                        .opacity(0.8)

                                    Text("UNKNOWN")
                                        .font(.custom("Radiance", size: 14))
                                }
                            }

                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height: 60)
                                    .foregroundColor(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text("UNKNOWN")
                                        .font(.custom("Radiance-SemiBold", size: 18))
                                        .padding(.top, 4)
                                        .opacity(0.8)

                                    Text("UNKNOWN")
                                        .font(.custom("Radiance", size: 14))
                                }
                            }

                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height: 60)
                                    .foregroundColor(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text("UNKNOWN")
                                        .font(.custom("Radiance-SemiBold", size: 18))
                                        .padding(.top, 4)
                                        .opacity(0.8)

                                    Text("UNKNOWN")
                                        .font(.custom("Radiance", size: 14))
                                }
                            }

                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height: 60)
                                    .foregroundColor(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text("UNKNOWN")
                                        .font(.custom("Radiance-SemiBold", size: 18))
                                        .padding(.top, 4)
                                        .opacity(0.8)

                                    Text("UNKNOWN")
                                        .font(.custom("Radiance", size: 14))
                                }
                            }

                            Spacer(minLength: 4)
                        }
                        .frame(width: .infinity, height: 64, alignment: .center)
                    }
                    // 胜率
                    //                            SegmentedBar(values: $values, colors: colors, isVertical: false)
                    //                                .frame(height: 6, alignment: .center)
                    //                                .padding()

                    // 最近的比赛
                    HStack {
                        Text("Recent")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.bottom, -10)
//                    DotaRecentSnapCarousel(trailingSpace: 30, index: $currentIndex, items: dotaData.dotaRecentMatchedList, content: { match in
//                        GeometryReader { proxy in
//                            let size = proxy.size
//
//                            DotaRecentCell(recent: match)
//                                .frame(width: size.width)
//                        }
//                    })
//                        .frame(height: 120)

                    TabView {
                        ForEach(dotaData.dotaRecentMatchedList) { match in
                            GeometryReader { proxy in
                                let size = proxy.size

                                DotaRecentCell(recent: match)
                                    .frame(width: abs(size.width - 30), height: 140, alignment: .leading)
                                    .padding(.horizontal, 15)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 160, alignment: .bottom)

                    // 游戏更新日志
//                    Divider()
//                        .padding(.leading, 20)
//                        .padding(.trailing, 20)

                    HStack {
                        Text("Patches")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            Spacer(minLength: 12)

                            if (patchVM.patches?.isEmpty) != false {
                                Text("Nothing here...")
                                    .font(.custom("Reaver-Bold", size: 16))
                                    .opacity(0.7)
                                    .frame(alignment: .leading)
                                    .frame(width: .infinity)
                                    .padding(.leading, 10)
                            } else {
                                ForEach(patchVM.patches ?? [], id: \.patch_timestamp) { patch in
                                    DotaPatchCell(patch: patch)
                                }
                            }

                            Spacer(minLength: 12)
                        }
                    }
                    .redacted(
                        reason: patchVM.isLoaded ? [] : .placeholder
                    )
                    .onAppear {
                        if firstFetchPatches || patchVM.isLoaded == false {
                            patchVM.requestPatches()
                            firstFetchPatches = false
                        }
                    }
                }
            }
            .navigationTitle("Dota")
            .sheet(isPresented: $showSetting, content: {
                NavigationView {
                    VStack {
                        Form {
                            Section(header: Text("General")) {
                                Picker(selection: $appearanceIndex, label: Text("Appearance")) {
                                    ForEach(0 ..< appearanceOptions.count) {
                                        Text(self.appearanceOptions[$0])
                                    }
                                }
                                Text("App Icon")
                                Picker(selection: $startpageIndex, label: Text("Start Page")) {
                                    ForEach(0 ..< startpageOptions.count) {
                                        Text(self.startpageOptions[$0])
                                    }
                                }
                            }

                            Section(
                                header: Text("About"),
                                footer: VStack(alignment: .leading) {
                                    HStack {
                                        Text("This app is powered by")
                                        Link("OpenDota", destination: URL(string: "https://www.opendota.com")!)
                                            .padding(.leading, 0)
                                            .padding(.trailing, 0)
                                    }
                                    Text("2019-2022 shockjockey.")
                                    Link("View on GitHub", destination: URL(string: "https://github.com/sh0ckj0ckey/OpenDota-iOS")!)
                                },
                                content: {
                                    HStack {
                                        Text("Version")
                                        Spacer()
                                        Text("v0.1.0")
                                            .opacity(0.6)
                                    }
                                    Text("Privacy Policy")
                                    Text("Send Feedback")
                                }
                            )
                        }
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: { self.showSetting.toggle() }) {
                                Text("Done")
                            }
                        }
                    }
                }
            })
            .sheet(isPresented: $showSearch, content: {
                NavigationView {
                    VStack {
                        HStack { Text("Search") }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: { self.showSearch.toggle() }) {
                                Text("Done")
                            }
                        }
                    }
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { self.showSetting.toggle() }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .imageScale(.medium)
                            .accessibility(label: Text("Setting"))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { self.showSearch.toggle() }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .imageScale(.medium)
                            .accessibility(label: Text("Search"))
                    }
                }
            }
        }
    }
}
