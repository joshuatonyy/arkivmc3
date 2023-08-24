//
//  ModalView.swift
//  arkivmc3
//
//  Created by Joshua on 25/08/23.
//

import SwiftUI

struct ModalView: View {
    
    var namaDaerah: String
    var namaDaerah2: String
    var hargaTanah: String
    
    var body: some View {
        VStack{
            Text("\(namaDaerah)")
            Text("\(namaDaerah2)")
            Text("Harga: \(hargaTanah)")
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(namaDaerah: "Meruya Selatan", namaDaerah2: "Kembangan, Jakbar", hargaTanah: "6,9 juta")
    }
}

