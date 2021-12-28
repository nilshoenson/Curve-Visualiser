//
//  SettingsView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct SettingsView: View {
	@EnvironmentObject var infos: Infos
	
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
					infos.animationPlaying = true
				}, label: {
					Text("Play Animation Once")
				})
				.help("Play Animation Once")
				
				Button(action: {
					print("Start")
				}, label: {
					Text("Start Loop")
				})
				.help("Change Loop")
				
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
