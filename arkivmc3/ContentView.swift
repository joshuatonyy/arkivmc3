//
//  ContentView.swift
//  arkivmc3
//
//  Created by Joshua on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var harga = 0
    @State private var dp = 0
    @State private var bungaNominal: Double = 0
    @State private var tenor: String = ""
    @State private var cicilan: Double = 0
    var bungaPersen: Double {
        bungaNominal / 100
    }
    var pokokPinjaman: Double {
        Double(harga - dp)
    }
    var a: Double {
        Double(pokokPinjaman * bungaPersen * (Double(tenor) ?? 0))
    }
    var bulan: Double {
        (Double(tenor) ?? 0) * 12
    }
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()
    
    var body: some View {
        VStack {
            TextField("Harga Rumah", value: $harga, formatter: numberFormatter)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding()
            TextField("Down Payment", value: $dp, formatter: numberFormatter)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding()
            Text("Pokok Pinjaman: \(pokokPinjaman, specifier: "%.0f")")
            Slider(value: $bungaNominal, in: 1...100)
                .padding()
            Text("Suku Bunga: \(bungaNominal, specifier: "%.1f") %")
            TextField("Tenor", text: $tenor)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding()
                .onSubmit {
                    if(pokokPinjaman != 0 && bungaNominal != 0){
                        cicilan =  a / bulan
                    }
                }
            Text("\(cicilan)")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
