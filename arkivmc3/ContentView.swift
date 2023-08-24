////
////  ContentView.swift
////  arkivmc3
////
////  Created by Joshua on 24/08/23.
////
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @State var isModalViewActive = true
    
    var body: some View {
        VStack{
            Text("Find Your")
            
            Text("Perfect Place.")
            
            Text("Find your perfect place for every adventure with us and  we have the ideal spot for you.")
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Spacer().frame(height: 200)
            
        }
        .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(.white
        )
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isModalViewActive) {
            ModalHomeView()
                .presentationDetents([.height(300), .height(700),.height(100)])
            
                .presentationDragIndicator(.visible)
            
                .interactiveDismissDisabled(true)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
