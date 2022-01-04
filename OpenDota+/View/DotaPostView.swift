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

                    HStack {
                        Text("Recent")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 20)
                    DotaRecentSnapCarousel(trailingSpace: 30, index: $currentIndex, items: dotaData.dotaRecentMatchedList, content: { match in
                        GeometryReader { proxy in
                            let size = proxy.size

                            DotaRecentCell(recent: match)
                                .frame(width: size.width)
                        }
                    })
                        .frame(height: 120)

                    Divider()
                        .padding(.leading, 20)
                        .padding(.trailing, 20)

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
                                        Text(".")
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

struct DotaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DotaPostView()
    }
}
