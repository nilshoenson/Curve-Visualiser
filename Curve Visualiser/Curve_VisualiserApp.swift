//
//  Curve_VisualiserApp.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
		func applicationDidFinishLaunching(_ notification: Notification) {
				if let window = NSApplication.shared.windows.first {
					window.styleMask = [ .titled, .closable, .miniaturizable]
					window.setFrameAutosaveName("Curve Visualiser")
					window.makeKeyAndOrderFront(nil)
					window.backgroundColor = NSColor.clear
				}
		}
}

@main
struct Curve_VisualiserApp: App {
		@NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
						TimingCurveView()
							.frame(width: 464, height: 600)
        }
    }
}
