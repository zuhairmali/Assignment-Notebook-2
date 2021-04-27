//
//  AssignmentList.swift
//  Assignment Notebook 2
//
//  Created by Student on 4/27/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items : [Assignment] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Assignment].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
