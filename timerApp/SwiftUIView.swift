//
//  SwiftUIView.swift
//  timerApp
//
//  Created by F. ISAMI. on 2024/05/10.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            VStack {
              Image("sample")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            }
        }
           
    }
}


#Preview {
    SwiftUIView()
}
