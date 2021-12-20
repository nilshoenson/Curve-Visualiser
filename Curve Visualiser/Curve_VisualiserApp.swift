//
//  Curve_VisualiserApp.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

@main
struct Curve_VisualiserApp: App {
    var body: some Scene {
        WindowGroup {
						TimingCurveView()
							.frame(width: 520, height: 600)
							.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
									windowSettings()
							})
        }
    }
	
	func windowSettings() {
		let appWindow = NSApplication.shared.windows[0]
		appWindow.standardWindowButton(NSWindow.ButtonType.zoomButton)?.isEnabled = false
		
		appWindow.styleMask = [ .titled, .closable, .miniaturizable, .resizable]
		appWindow.setFrameAutosaveName("Curve Visualiser")
		appWindow.makeKeyAndOrderFront(nil)
	}
}
