//
//  AllocationsView.swift
//  Money Allocation
//
//  Created by Antonia Angelia Widjaja on 15/05/23.
//

import SwiftUI

struct AllocationsView: View {
    
    @AppStorage("allocationStorage") var allocationStorage: Data = Data()
    @ObservedObject var allocationDataManager: AllocationDataManager
    
    @Binding var showModalView: Bool
    
    @State var category: String = ""
    @State var percentage: Double?
    
    var body: some View {
        VStack {
            Form {
                Section ("Set New Allocation") {
                    HStack {
                        Image(systemName:"list.bullet")
                        Text("Category")
//                        .frame(width: 80)
                        
                        Spacer()
                        
                        TextField("insert category name", text: $category)
                            .frame(width:168, height: 5)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.903))
                            .cornerRadius(10)
                        
                            .keyboardType(.default)
                        
                    }
                    HStack {
                        Image(systemName:"percent")
                        Text("Allocation")
                        //                                                    .frame(width:)
                        
                        
                        TextField("allocation out of 100", value: $percentage, format: .number)
                            .frame(width: 140, height: 5)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.903))
                            .cornerRadius(10)
                        
                            .keyboardType(.numberPad)
                        
                                                                        Text("%")
                        
                    }
                    HStack (alignment: .center) {
                        Spacer()
                        Button {
                            allocationDataManager.addAllo(category: category, percentage: percentage ?? 0.0)
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("BrandColor"))
                                .cornerRadius(40)
                        }
                        Spacer()
                    }
                }
                Section ("Allocations") {
                    List (allocationDataManager.allocationData) { data in
                        HStack{
                            Text(data.categoryID)
//                                .frame(width: 200)
//                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(data.percentageID.description)
                            Text("%")
                        }
                    }
                }
            }
                
        }
        .navigationBarTitle("Allocate 'Em Out!", displayMode: .inline)
//        .toolbar {
//            ToolbarItem(placement: .confirmationAction){
//                Button{
//                    //isi apa ya hmmm
//                } label: {
//                    Text("Save")
//                }
//            }
//
//            ToolbarItem(placement: .cancellationAction){
//                Button{
//                    showModalView = false
//                } label: {
//                    Text("Cancel")
//                        .foregroundColor(.red)
//                }
//            }
//        }
    }
}

struct AllocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AllocationsView(allocationDataManager: AllocationDataManager(), showModalView: .constant(false))
        }
    }
}

