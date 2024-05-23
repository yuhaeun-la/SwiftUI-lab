//
//  ShowImageView.swift
//  CarouselView
//
//  Created by 유하은 on 5/23/24.
//

import SwiftUI

struct ShowImageView: View {
    @State var show = false
    @Binding var Viewsheet:Bool
    
    var body: some View {
        ZStack(alignment: .top){
            ScrollView {
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("My Gallery").bold()
                        .font(.largeTitle)
                    
                    Text("江風明月").bold()
                        .font(.title)
                    
                    Text("강풍명월: 강가의 바람과 하늘의 밝은 달")
                }
            }
            .padding(30)
            
            .frame(maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60,
                   maxHeight:show ? .infinity : 260,alignment: .top)
            .offset(y: show ? 450 : 40)
            
            Image("1")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .onTapGesture {
                    withAnimation(.spring(response: 0.4,dampingFraction: 0.6)){
                        self.show.toggle()
                    }
                }
                .frame(
                    maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60,
                    maxHeight: show ? 450 : 460)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 20)
        }
        .overlay(alignment: .topTrailing, content: {
            Image(systemName: "xmark.circle")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(show ? 30 : 20)
                .onTapGesture {
                    Viewsheet.toggle()
                }
        })
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ShowImageView(Viewsheet: .constant(false))
}
