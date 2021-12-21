//
//  DropdownView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct DropdownView: View {
	@State private var selectedItem: Int = 0
			
	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			Text("Curve")
				.font(.system(size: 12))
				.fontWeight(.semibold)
				.foregroundColor(Color.white)
				.frame(width: 44.0, alignment: .leading)
			
			VStack {
				Picker("", selection: $selectedItem) {
					Text("Red").tag(0)
					Text("Blue").tag(1)
					Text("Green").tag(2)
				}
				.frame(width: 184)
				.accentColor(Colors.primary)
				.clipped() 
			}
		}
		.controlSize(.large)
	}
}

// MARK: - Style
