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
					Button("Lorem Ipsum...") {
						print("Lorem Ipsum...")
					}

					Button("Dolor sit amet...") {
						print("Dolor sit amet...")
					}
					
					VStack {
						Divider()
					}
					
					Menu("Export Animation to...") {
						// Export to SwiftUI
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toSwiftUi(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Text("SwiftUI")
						}
						
						// Export to CSS
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toCSS(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Text("CSS")
						}
						
						// Export to JSON
						Button(action: {
							pasteboard.clearContents()

							let contents = "\(Exporter.toJSON(values: appState.values, duration: appState.duration))"
							pasteboard.setString(contents, forType: .string)
						}) {
							Text("JSON")
						}
					}
				}
		}
}
