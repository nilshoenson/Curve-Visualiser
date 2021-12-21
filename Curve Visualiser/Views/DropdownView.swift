//
//  DropdownView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct DropdownView: View {
	@State private var selectedItem: String = "Linear"
	let curves = [
		"Linear",
		"Ease In",
		"Ease Out",
		"Ease In Out",
		"Custom"
	]
			
	var body: some View {
		HStack(alignment: .center, spacing: 2) {
			HStack {
				Spacer()
				Text("Curve")
					.font(.system(size: 12))
					.fontWeight(.semibold)
					.foregroundColor(Color.white)
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			.frame(width: 60, height: 28)
			
			VStack {
				Picker("", selection: $selectedItem) {
					ForEach(curves, id: \.self) {
						Text($0)
					}
				}
				.frame(width: 232)
				.accentColor(Colors.primary)
				.clipped() 
			}
		}
		.controlSize(.large)
		.textFieldStyle(.roundedBorder)
	}
}
