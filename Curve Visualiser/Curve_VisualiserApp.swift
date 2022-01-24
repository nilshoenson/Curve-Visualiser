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
	
	private var aboutBoxWindowController: NSWindowController?

	func showAboutPanel() {
		if aboutBoxWindowController == nil {
			let styleMask: NSWindow.StyleMask = [.closable, .titled]
			let window = NSWindow()
			window.styleMask = styleMask
			window.backingType = .buffered
			window.title = ""
			window.isMovableByWindowBackground = true
			window.isReleasedWhenClosed = false
			window.contentView = NSHostingView(rootView: AboutView(bundle: Bundle.main, websiteURL: "https://nilshoenson.com/"))
			window.center()
			
			aboutBoxWindowController = NSWindowController(window: window)
		}

		aboutBoxWindowController?.showWindow(aboutBoxWindowController?.window)
	}
}

@main
struct Curve_VisualiserApp: App {
		@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
			WindowGroup {
				TimingCurveView()
					.frame(width: 440, height: 590)
					.preferredColorScheme(.dark)
			}
			.commands {
				CommandGroup(replacing: CommandGroupPlacement.appInfo) {
					Button(action: {
						appDelegate.showAboutPanel()
					}) {
						let aboutSuffix = NSLocalizedString("About", comment: "")
						Text("\(aboutSuffix)\u{00a0}\(Bundle.main.appName)")
					}
				}
			}
    }
}


