//
//  NavigationMenuItems.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 09/02/2022.
//

import SwiftUI

struct MenuGroup<Content>: View where Content: View {
		let title: String
		let content: () -> Content

		init(title: String, @ViewBuilder content: @escaping () -> Content) {
				self.title = title
				self.content = content
		}

		var body: some View {
				if #available(macOS 11.0, *) {
						Menu(title) {
								content()
						}
				} else {
						MenuButton(label: Text(title), content: content)
				}
		}
}

struct NavigationMenuItems: View {
		let pasteboard = NSPasteboard.general
		@EnvironmentObject var appState: AppState
	
		var body: some View {
				Group {					
					Menu("Copy Animation as...") {
						// Export to CSS
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toCSS(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Image("CSS")
								.frame(width: 16, height: 16)
							Text("CSS")
						}
						
						// Export to Framer Motion
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toFramerMotion(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Image("Framer")
								.frame(width: 16, height: 16)
							Text("Framer Motion")
						}
						
						// Export to JavaScript
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toJavascript(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Image("Javascript")
								.frame(width: 16, height: 16)
							Text("JavaScript")
						}
						
						// Export to JSON
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toJSON(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Image("Json")
								.frame(width: 16, height: 16)
							Text("JSON")
						}
						
						// Export to SwiftUI
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toSwiftUi(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Image(systemName: "swift")
							Text("SwiftUI")
						}
						
						VStack {
							Divider()
						}
						
						// Export to Text
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toText(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Text("Copy Text")
						}
					}
					
					VStack {
						Divider()
					}
					
					Button(action: {
						NSApplication.shared.terminate(self)
					}) {
						Text("Quit")
					}
					.keyboardShortcut("q", modifiers: [.command])
				}
		}
}
