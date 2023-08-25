//
//  ContentView.swift
//  arkivmc3
//
//  Created by Joshua on 24/08/23.
//

import SwiftUI
import Foundation

struct CalculatorView: View {
    @State private var hargaRumah:Double = 0
    @State private var dp:Double = 0
    @State private var sukuBunga: Double = 1
    @State private var tahun: Double = 0
    @State private var totalCicilanKpr: Double = 0
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()
    
    var body: some View {
        VStack {
            Text("Harga rumah")
            TextField("Harga Rumah", value: $hargaRumah, formatter: numberFormatter)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding()
            Text("Down Payment")
            TextField("Down Payment", value: $dp, formatter: numberFormatter)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding()

            Slider(value: $sukuBunga, in: 1...15, step: 0.1)
                .padding()
            Text("Suku Bunga: \(sukuBunga, specifier: "%.2f") %")
            TextField("Tenor", value: $tahun,  formatter: numberFormatter)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding()
            
            Button(action: {
                if(hargaRumah != 0 && dp != 0 && sukuBunga != 0 && tahun != 0){
                    let mortages = self.calculateMortage(hargaRumah: hargaRumah, dp: dp, sukuBunga: sukuBunga, tahun: tahun)
                    print("mortages \(mortages)")
                    let monthlyLoans = self.calculateMonthlyLoan(hargaRumah: hargaRumah, dp: dp, sukuBunga: sukuBunga, tahun: tahun)
                    print("monthlyLoans \(monthlyLoans)")
                    
                    let initialLoans = self.calculateInitialLoan(monthlyLoan: monthlyLoans, mortage: mortages)
                    print("initialLoans \(initialLoans)")
                    
                    let loanTotals = self.calculateLoanTotal(monthlyLoan: monthlyLoans, tahun: tahun)
                    print("loanTotals \(loanTotals)")
                    
                    let loanInterestTotals = self.calculateLoanInterestTotal(loanTotal: loanTotals, hargaRumah: hargaRumah, dp: dp)
                    print("loanInterestTotals \(loanTotals)")
                    print("slider \(sukuBunga)")
                    
                    totalCicilanKpr = mortages + initialLoans
                    print("sdada")
                }
              
            }) {
                Text("Calculate")
            }.buttonStyle(.bordered)
            
            Text("\(totalCicilanKpr )")
            
        }
        .padding()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

