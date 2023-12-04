//
//  OutputView.swift
//  Money Allocation
//
//  Created by Antonia Angelia Widjaja on 17/05/23.
//

import SwiftUI

struct OutputView: View {
    @State private var isButtonPressed = false
    @State private var inputAnotherPressed = false
    @State private var isButtonEnabled: Bool = false
    
    var allocationDataInOutputView: AllocationDataManager
    var totalPendapatan: Int?
    
    var totalNeeds: Double?
    var totalWants: Double?
    var totalSharing: Double?
    var totalSavings: Double?
    
    var body: some View {
        VStack {
            Text("Allocations Result")
                .font(.title)
                .fontWeight(.bold)
            
            Form {
                Section {
//                    Text("Numbers: \(allocationDataInOutputView.allocationData.count)")
                    
                    ForEach(0..<allocationDataInOutputView.hasilResult.count, id: \.self) { index in
                        HStack {
                            Text(allocationDataInOutputView.allocationData[index].categoryID)
                            Spacer(minLength: 10)
                            Text("Rp")
                            Text(allocationDataInOutputView.hasilResult[index], format: .number)
                            Text(",00")
                                .padding(.leading,-9)
                        }
                    }
                }
//                HStack (alignment: .center) {
//                    Spacer()
//                    Button(action: {
//                        inputAnotherPressed = true
//                    }) {
//                        Text("Input Another!")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color("BrandColor"))
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    Spacer()
//                }
            }
//            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.27)
//            .scrollContentBackground(.hidden)
        }
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView(allocationDataInOutputView: AllocationDataManager())
    }
}
    
