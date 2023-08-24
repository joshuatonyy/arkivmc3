//
//  DummyView.swift
//  arkivmc3
//
//  Created by Muhammad Athif on 25/08/23.
//

import SwiftUI

struct DummyView: View {
    @State private var hargaRumah:Double = 0
    @State private var dp:Double = 0
    @State private var sukuBunga: Double = 1
    @State private var tahun: Double = 0
    @State private var totalCicilanKpr: Double = 0
    
    @State private var luasTanah: Double = 0
    @State private var hargaTanah: Double = 0
    let hargaKonstruksi:Double = 3000000
    var lokasi:String
    var hargaTanahString: String
    
    
    
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()
    
    var body: some View {
        VStack {
            Text("Daerah: \(lokasi)")
            Text("Harga per m^2: \(hargaTanahString)")
            Spacer()
            Group{
                Text("Luas Tanah (m^2)")
                TextField("Luas Tanah", value: $luasTanah, formatter: numberFormatter)
                    .keyboardType(.decimalPad)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    .padding()
                    .onSubmit {
                        hargaRumah = self.calculateHousePrice(lokasi: "Meruya Selatan, Kembangan, Jakbar", hargaKonstruksi: hargaKonstruksi, luasTanah: luasTanah)
                    }
                Text("Harga rumah")
                TextField("Harga Rumah", value: $hargaRumah, formatter: numberFormatter)
                    .disabled(true)
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
                
            }
            
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
                }
                
            }) {
                Text("Calculate")
            }.buttonStyle(.bordered)
            
            Text("\(totalCicilanKpr, specifier: "%.0f" )")
            
        }
        .onAppear {
            //            hargaRumah = self.calculateHousePrice(lokasi: "Meruya Selatan, Kembangan, Jakbar", hargaKonstruksi: hargaKonstruksi, luasTanah: luasTanah)
        }
        .padding()
    }
    
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView(lokasi: "Cipedak, Jagakarsa, Jaksel", hargaTanahString: "6,7 juta")
    }
}
