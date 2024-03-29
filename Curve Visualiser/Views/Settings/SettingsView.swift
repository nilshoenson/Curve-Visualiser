//
//  SettingsView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct SettingsView: View {
	@EnvironmentObject var appState: AppState
	
	var body: some View {
		VStack(spacing: 24) {
			VStack(alignment: .center, spacing: 20) {
				DropdownView()
				InputView()
				DurationView()
			}
			
			HStack {
				Spacer()
				Button(action: {
					appState.animationPlaying = true
					appState.animationLooping = false
				}, label: {
					Label("Play", systemImage: "play.fill")
				})
				.help("Play Animation Once")
				
				Button(action: {
					appState.animationLooping.toggle()
					appState.animationPlaying = false
				}, label: {
					Label(
						"\(appState.animationLooping ? "Stop" : "Start") Loop",
						systemImage: appState.animationLooping ? "stop.fill" : "repeat"
					)
				})
				.help("\(appState.animationLooping ? "Stop" : "Start") Animation Loop")
				
				Spacer()
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
			.padding(24)
			.overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Colors.stroke), alignment: .top)
		}
	}
}

// MARK: - Button Style
fileprivate struct UberaboutWindowButtonStyle: ButtonStyle {
		func makeBody(configuration: Configuration) -> some View {
				let color = Color.accentColor
				let pressed = configuration.isPressed
				return configuration.label
						.font(Font.body.weight(.medium))
						.padding([.leading, .trailing], 8.0)
						.padding([.top], 4.0)
						.padding([.bottom], 5.0)
						.background(color.opacity(pressed ? 0.08 : 0.14))
						.foregroundColor(color.opacity(pressed ? 0.8 : 1.0))
						.cornerRadius(5.0)
						
		}
}
