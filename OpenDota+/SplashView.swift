//
//  SplashView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2022/1/3.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: Bool = false

    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                VStack {
                    Spacer()
                    HStack {
                        Image("OpenDotaLaunchLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 108, height: 108, alignment: .leading)
                            //.shadow(radius: 10)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("OpenDota+")
                                .font(.custom("Reaver-Bold", size: 24))
                            Text("Powered by OpenDota")
                                .font(.custom("Radiance", size: 16))
                                .opacity(0.7)
                                .padding(.leading, 2)
                        }
                    }
                    Spacer()
//                    Text("Powered by OpenDota")
//                        .font(.custom("Reaver-Bold", size: 16))
//                        .opacity(0.9)
//                        .padding(.bottom, 20)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 0.4).delay(0.1)) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
