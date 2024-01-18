//
//  Container.swift
//  match3
//
//

import SwiftUI

class Container:ObservableObject {
    @Published var savedMaps: [SavedMap] = Array<SavedMap>(rawValue: UserDefaults.standard.string(forKey: "saved_maps") ?? "[]") ?? [] {
        didSet {
            UserDefaults.standard.setValue(savedMaps.rawValue, forKey: "saved_maps")
        }
    }
}
