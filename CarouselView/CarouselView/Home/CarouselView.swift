//
//  CarouselView.swift
//  CarouselView
//
//  Created by 유하은 on 5/23/24.
//

import SwiftUI

struct CarouselView: View {
    let images :[String] = ["1","2","3","4","5"]
    
    @State var sheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .fontDesign(.serif)
                .font(.system(size: 50))
                .bold()
                .padding(.leading,15)
                .offset(y:-50)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(images,id: \.self) { index in
                        GeometryReader { geometry in
                            Image(index)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 300)
                                .cornerRadius(15)
                                .rotation3DEffect(
                                    Angle(
                                        degrees: Geometry(geo: geometry)) * 20,
                                        axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .onTapGesture {
                                    sheet.toggle()
                            }
                        }
                        .frame(width: 220, height: 300)
                        .fullScreenCover(isPresented: $sheet, content: {
                            ShowImageView(Viewsheet: $sheet)
                        })
                    }
                }
                .padding(.top)
                .padding(.bottom,40)
            }
        }
    }
    
    
    func Geometry(geo:GeometryProxy)-> Double{
        let maxdis = UIScreen.main.bounds.width / 2
        let currenmax = geo.frame(in: .global).midX
        return Double( 1 - currenmax / maxdis)
    }
}

#Preview {
    CarouselView()
}
