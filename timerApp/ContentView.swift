//
//  ContentView.swift
//  timerApp
//
//  Created by F. ISAMI. on 2024/05/09.
//

import SwiftUI

struct ContentView: View {
    @State var timeHandler: Timer?
    @State var count = 0
    @AppStorage("timer_value") var timeValuer = 10
    @State var showAlert = false
    var body: some View {
        
        NavigationStack{
            ZStack {
                
                Image(.backgroundcolor)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing: 30.0){
                    Text("残り\(timeValuer - count)秒")
                        .font(.largeTitle)
                    HStack{
                        Button{
                            //action
                            startTimer()
                        }
                    label:
                        {Text("start")
                                .font(.title)
                            //
                                .foregroundStyle(Color.white)
                            //
                                .frame(width: 140, height: 140)
                            //
                                .background(Color.start)
                            //
                                .clipShape(Circle())
                        }//button
                        ///stop sign
                        Button{
                            //action
                            if let timeHandler {
                                if timeHandler.isValid == true {
                                    timeHandler.invalidate()
                                }//if timeHandler.isValid
                            }// if let timeHandler
                            
                        }
                    label:
                        {Text("stop")
                                .font(.title)
                            //
                                .foregroundStyle(Color.white)
                            //
                                .frame(width: 140, height: 140)
                            //
                                .background(Color.end)
                            //
                                .clipShape(Circle())
                        }//button
                    }//Hstack
                }//Vstack
            }//Zstack
            .onAppear{
                count = 0
            }//onAppear
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    //NavigationLink
                    NavigationLink{
                        settingView()
                    }label:
                    {Text ("second setting")}
                }//Navigation Link
            }//ToolBarItem
            
        }// .toolbar
        .alert ("Done", isPresented: $showAlert){
            Button("OK"){
                print ("button tapped")
            }//Button
        }//.alert
        message :{
            Text("time up")
        }//message
        
        
    } // Navigation Stack
    
    
    
    //
    func countDownTimer(){
        count += 1
        if timeValuer - count <= 0{
            timeHandler?.invalidate()
            // show alert
            showAlert = true
        }//if
    }//countDownTImer
    //Start Countdown
    func startTimer(){
    //Unwrap Timer Handler
        if let timeHandler {
            if timeHandler.isValid == true{
                //nothing reaction
                return
            }//if timeHandler.isValid
        }//if end
        if timeValuer - count <= 0 {
            //initialize count
            count = 0
        }//if timeValue
        //timer start
        timeHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        { _ in
            countDownTimer()
        }
        
    }//startTimer
}//Body View
//
#Preview {
    ContentView()
}
