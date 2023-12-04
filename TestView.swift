//
//  TestView.swift
//  Money Allocation
//
//  Created by Antonia Angelia Widjaja on 18/05/23.
//

import SwiftUI

struct TestView: View {
    
    @ObservedObject var allocationDataManagerInputView: AllocationDataManager
    
    let number = 1000
        let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = "."
            formatter.usesGroupingSeparator = true
            return formatter
        }()
    
    var body: some View {
        VStack{
            Text(numberFormatter.string(from: NSNumber(value: number)) ?? "")
            
            TextField("insert your income here", value: $allocationDataManagerInputView.totalPendapatan, format: .number)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.black)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.903))
                .cornerRadius(10)
                .padding()
                .keyboardType(.decimalPad)
            
//            TextField("Enter amount", value: amount, formatter: numberFormatter)
//                            .padding()
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Text("Formatted amount: \(numberFormatter.string(for: amount) ?? "")")
//
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(allocationDataManagerInputView: AllocationDataManager())
    }
}
