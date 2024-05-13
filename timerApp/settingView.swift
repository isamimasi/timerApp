//
//  settingView.swift
//  timerApp
//
//  Created by F. ISAMI. on 2024/05/09.
//

import SwiftUI

struct settingView: View {
    //@State var timeValue = 10
    @AppStorage("timer_value") var timeValue = 10
    var body: some View {
        ZStack{
            Color.backgroundsetting
                .ignoresSafeArea()
        }//ZStack
        VStack{
            //
            Spacer()
            Text ("\(timeValue)  sec")
                .font(.largeTitle)
            Spacer()
            //
            Picker(selection: $timeValue){
                Text("10").tag(10)
                Text("20").tag(20)
                Text("30").tag(30)
                Text("40").tag(40)
                Text("50").tag(50)
                Text("60").tag(60)
            }//picker
        label:{
            Text("選択")
        }
        .pickerStyle(.wheel)
        Spacer()
        }//VStack
    }
}

#Preview {
    settingView()
}
