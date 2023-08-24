//
//  extensionView.swift
//  arkivmc3
//
//  Created by Muhammad Athif on 25/08/23.
//

import Foundation
import SwiftUI

extension View {
    
    
    // MARK: Khusus bunga pinjaman awal
    func calculateMortage(hargaRumah:Double, dp: Double, sukuBunga:Double, tahun:Double) -> Double{
        
        let totalBulan: Double = Double(tahun * 12)
        let sukuBunga_: Double = sukuBunga / 100
        let pokokPinjaman_: Double = hargaRumah - dp
        
        let result: Double = pokokPinjaman_ * sukuBunga_ * tahun / totalBulan
        
        return result
    }
    
    // MARK: Pinjaman perbulan
    func calculateMonthlyLoan(hargaRumah:Double, dp: Double, sukuBunga:Double, tahun:Double) -> Double{
        let totalBulan: Double = Double(tahun * 12)
        let sukuBunga_: Double = sukuBunga / 100
        let pokokPinjaman_: Double = hargaRumah - dp
        
        var temp:Double = (1 + sukuBunga_ / 12)
        let result = (pokokPinjaman_ * sukuBunga_ / 12) / (1-pow(temp, -totalBulan))
        
        return result
    }
    
    
    // MARK: Nilai Pokok Pinjaman Awal
    func calculateInitialLoan(monthlyLoan:Double, mortage:Double) -> Double{
        let result: Double = monthlyLoan - mortage
        return result
        
        
    }
    
    // MARK: total pinjaman
    func calculateLoanTotal(monthlyLoan: Double, tahun:Double) -> Double{
        
        let totalBulan: Double = Double(tahun * 12)
        
        let result = monthlyLoan * totalBulan
        
        return result
    }
    
    // MARK: total bunga pinjaman
    func calculateLoanInterestTotal(loanTotal:Double, hargaRumah:Double, dp: Double) -> Double{
        
        let pokokPinjaman_: Double = hargaRumah - dp
        
        let result = loanTotal - pokokPinjaman_
        
        return result
    }
    
    // MARK: harga rumah berdasarkan luas tanah
    func calculateHousePrice(lokasi:String, hargaKonstruksi:Double, luasTanah:Double) -> Double {
        var hargaTanah:Double = 0
        
        switch lokasi {
        case "Meruya Selatan, Kembangan, Jakbar":
            hargaTanah = 6900000
        case "Cipedak, Jagakarsa, Jaksel":
            hargaTanah = 3000000
        case "Pulo Gebang, Cakung, Jaktim":
            hargaTanah = 5100000
        default:
            print("")
        }
        
        let result = (hargaTanah + hargaKonstruksi) * luasTanah
        
        return result
        
    }
}
