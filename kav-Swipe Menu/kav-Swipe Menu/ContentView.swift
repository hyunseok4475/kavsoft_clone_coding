//
//  ContentView.swift
//  kav-Swipe Menu
//
//  Created by 송현석 on 2022/06/30.
//

import SwiftUI

struct ContentView: View {
    
    // 내가 만족할만큼 값을 올리면 위로 올라온다.
    @State var size: CGFloat = UIScreen.main.bounds.height - 130
    
    var body: some View {
        
        ZStack {
            Color.orange
            
            swipe()
                .cornerRadius(20)
                .padding(15)
                .offset(y: size)
                .gesture(DragGesture()
                    .onChanged({ (value) in
                        if value.translation.height > 0 {
                            self.size = value.translation.height
                        }
                        else {
                            let temp = UIScreen.main.bounds.height - 130
                            self.size = temp + value.translation.height
                        }
                    })
                        .onEnded({ (value) in
                            
                            if value.translation.height > 0 {
                                if value.translation.height > 200 {
                                    self.size = UIScreen.main.bounds.height - 130
                                }
                                else {
                                    self.size = 15
                                }
                            }
                            
                            else {
                                
                                if value.translation.height < -200 {
                                    self.size = 15
                                }
                                else {
                                    self.size = UIScreen.main.bounds.height - 130
                                }
                                
                            }
                            
                        })
                )
                .animation(.spring(), value: true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct swipe: View {
    
    var body: some View {
        
        
        VStack {
            
            // 뷰를 위아래로 누르기 위한 것
            VStack {
                // top + bottom 30 그래서 높이 근사치 - 100
                Text("Swipe up to See More")
                    .fontWeight(.heavy)
                    .padding([.top, .bottom], 15)

            }
            
            //나의 커스텀 뷰
            HStack {
                Spacer()
                Text("Hello top")
                    .fontWeight(.heavy)
                    .padding()
            }
            
            Spacer()
            Text("Hello Bottom")
        }
        .background(Color.white)
    }
}
