//
//  ModalView.swift
//  arkivmc3
//
//  Created by Joshua on 25/08/23.
//

import SwiftUI

struct ModalView: View {
    
    var namaDaerah: String
    var hargaTanah: String
    
    var body: some View {
        VStack{
            Text("\(namaDaerah)")
            Text("Harga: \(hargaTanah)")
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(namaDaerah: "Meruya Selatan", hargaTanah: "6,9 juta")
    }
}

