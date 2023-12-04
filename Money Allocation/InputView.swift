//
//  ContentView.swift
//  Money Allocation
//
//  Created by Antonia Angelia Widjaja on 08/05/23.
//

import SwiftUI



struct InputView: View {
    
    @ObservedObject var allocationDataManagerInputView: AllocationDataManager
    
    @State private var showModalView: Bool = false
    @State private var isButtonEnabled: Bool = false
    @State var category: String = ""
    @State var percentage: Double?
    //    @State private var totalPendapatan: Double?
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Your Money")
                    .font(.title)
                    .fontWeight(.bold)
                
                TextField("insert your income here", value: $allocationDataManagerInputView.totalPendapatan, format: .number)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.903))
                    .cornerRadius(10)
                    .padding()
                    .keyboardType(.decimalPad)
                
                HStack{
                    Button {
                        showModalView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showModalView) {
                        NavigationStack {
                            AllocationsView(allocationDataManager: allocationDataManagerInputView, showModalView: $showModalView)
                        }
                    }
                    
                    if isButtonEnabled {
                        NavigationLink(destination: OutputView(allocationDataInOutputView: allocationDataManagerInputView)) {
                            Text("Allocate Now!")
                                .padding()
                                .background(Color("BrandColor"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    } else {
                        Button(action: {
                            //kasi opo yo hmmm
                        }) {
                            Text("Allocate Now!")
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(true)
                    }
                }
                .padding()
            }
            .onChange(of: allocationDataManagerInputView.allocationData, perform: {newValue in
                if allocationDataManagerInputView.allocationData.count <= 0 {
                    isButtonEnabled = false
                } else {
                    isButtonEnabled = true
                }
            })
        }
//        .onAppear {
//                    if allocationData.isEmpty {
//                        showModalView = true
//                    }
//                }
//                .sheet(isPresented: $showModalView) {
//                    AllocationsView()
//                }
    }
}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(allocationDataManagerInputView: AllocationDataManager())
    }
}

