//
//  ModalHomeView.swift
//  arkivmc3
//
//  Created by Muhammad Athif on 24/08/23.
//
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

import SwiftUI

struct ModalHomeView: View {
    var body: some View {
        VStack{
            Text("Find Your")
            
            Text("Perfect Place.")
            
            Text("Find your perfect place for every adventure with us and  we have the ideal spot for you.")
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Spacer().frame(height: 200)
        
                ZStack{
                   
                    Text("Perfect Place.")
                       

                }
                .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(.red)
                .cornerRadius(30, corners: [.topLeft, .topRight])

            
            
        }
            .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(.blue)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ModalHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ModalHomeView()
    }
}
