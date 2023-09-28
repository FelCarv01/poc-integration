//
//  ContentView.swift
//  poc-integration
//
//  Created by Felipe Carvalho on 28/09/23.
//

import SwiftUI
import Flutter
import UIKit

struct ContentView: View {
    @EnvironmentObject var flutterDependencies: FlutterDependencies
    var body: some View {
        Button{
            flutterHome()
        }label: {
            Text("Abri Flutter")
        }
    }
    
    func flutterHome() {
        guard
            let windowScene = UIApplication.shared.connectedScenes.first(where: {$0.activationState == .foregroundActive && $0 is UIWindowScene}) as? UIWindowScene,
            let window = windowScene.windows.first(where: \.isKeyWindow),
            let rootViewController = window.rootViewController
        else { return }
        
        let flutterViewController = FlutterViewController(engine: flutterDependencies.homeFlutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .overCurrentContext
        flutterViewController.isViewOpaque = false
        rootViewController.present(flutterViewController, animated: true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
