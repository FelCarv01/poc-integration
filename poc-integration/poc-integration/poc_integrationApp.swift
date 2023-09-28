//
//  poc_integrationApp.swift
//  poc-integration
//
//  Created by Felipe Carvalho on 28/09/23.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant

class FlutterDependencies: ObservableObject {
    let homeFlutterEngine = FlutterEngine(name: "flutter_home_engine")
    init(){
        homeFlutterEngine.run()
    }
}

@main
struct poc_integrationApp: App {
    @StateObject var flutterDependencies = FlutterDependencies()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(flutterDependencies)
        }
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
