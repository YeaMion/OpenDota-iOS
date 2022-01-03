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
                    Image("OpenDotaLaunchLogo")
                        .shadow(radius: 10)
                    Spacer()
                    Text("Powered by OpenDota")
                        .font(.custom("Reaver-Bold", size: 16))
                        .opacity(0.9)
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
