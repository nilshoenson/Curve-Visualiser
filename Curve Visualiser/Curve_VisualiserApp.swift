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
			window.title = ("Curve Visualiser")
		}
		
		NSWindow.allowsAutomaticWindowTabbing = false
	}
	
	private var aboutBoxWindowController: NSWindowController?

	func showAboutPanel() {
		if aboutBoxWindowController == nil {
			let styleMask: NSWindow.StyleMask = [.closable, .titled]
			let window = NSWindow()
			window.styleMask = styleMask
			window.backingType = .buffered
			window.titleVisibility = .hidden
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
		@StateObject var appState = AppState()
		let pasteboard = NSPasteboard.general
	
    var body: some Scene {
			WindowGroup {
				TimingCurveView(appState: appState)
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
				CommandMenu("Animation") {
					Button(action: {
						 appState.animationPlaying = true
						 appState.animationLooping = false
					}) {
						Text("Play Animation")
					}
					.disabled(appState.animationPlaying)
					.keyboardShortcut("r", modifiers: [.command])
					
					Button(action: {
						appState.animationLooping.toggle()
						appState.animationPlaying = false
					}) {
						Text("Start/Stop Animation Loop")
					}
					.keyboardShortcut("r", modifiers: [.command, .shift])
				}
			}
    }
}

