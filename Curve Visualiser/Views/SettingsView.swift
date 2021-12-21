//
//  SettingsView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct SettingsView: View {
	var body: some View {
		VStack(spacing: 24) {
			VStack(alignment: .center, spacing: 20) {
				DropdownView()
				InputView()
				DurationView()
			}
			
			HStack {
				Button(action: {
					print("Start")
				}, label: {
					Image(systemName: "play.fill")
				})
				.help("run")
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
			.padding(24)
			.overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Colors.stroke), alignment: .top)
		}
	}
}
