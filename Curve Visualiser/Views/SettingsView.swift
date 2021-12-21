//
//  SettingsView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct SettingsView: View {
	var body: some View {
		VStack(spacing: 20) {
			VStack(alignment: .center, spacing: 16) {
				DropdownView()
				InputView()
			}
			
			HStack {
				Button(action: {
					print("Start")
				}, label: {
					Image(systemName: "play.fill")
					Text("Start")
				})
				.help("run")
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
			.padding(20)
			.overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Colors.stroke), alignment: .top)
		}
	}
}
