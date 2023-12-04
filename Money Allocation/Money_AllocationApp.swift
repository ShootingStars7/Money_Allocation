//
//  Money_AllocationApp.swift
//  Money Allocation
//
//  Created by Antonia Angelia Widjaja on 08/05/23.
//

import SwiftUI

@main
struct Money_AllocationApp: App {
    var body: some Scene {
        WindowGroup {
            InputView(allocationDataManagerInputView: AllocationDataManager())
            
        }
    }
}
