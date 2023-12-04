//
//  AllocationData.swift
//  Money Allocation
//
//  Created by Antonia Angelia Widjaja on 16/05/23.
//

import Foundation

//struct AllocationData: Codable {
//    var category: String
//    var percentage: Double
//}

struct MyData: Identifiable, Equatable, Hashable {
    var id = UUID()
    var categoryID: String
    var percentageID: Double
}

class AllocationDataManager: ObservableObject {
    @Published var allocationData: [MyData] = []

    @Published var totalPendapatan: Double?
    
    var hasilResult: [Double]{
        var numArr = [Double]()
        for num in allocationData {
            numArr.append((totalPendapatan ?? 0.0) * num.percentageID / 100)
        }
        return numArr
    }
    
    func addAllo(category: String, percentage: Double){
        allocationData.insert(MyData(categoryID: category, percentageID: percentage), at: 0)
        
    }
    
}
