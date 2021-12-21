//
//  InputView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

extension NSTextField { // << workaround !!!
	open override var focusRingType: NSFocusRingType {
		get { .none }
		set { }
	}
}

struct InputView: View {
	@State private var selectedItem: Int = 0
	@State private var username: String = ""
	@State private var fullName: String = ""
	
	var body: some View {
		HStack(alignment: .center, spacing: 12) {
			Text("Values")
				.font(.system(size: 12))
				.fontWeight(.semibold)
				.foregroundColor(Color.white)
				.frame(width: 44.0, alignment: .leading)
			
			VStack(spacing: 8) {
				HStack(spacing: 8) {
					TextField("Username", text: $username)
					TextField("Username", text: $fullName)
				}
				HStack(spacing: 8) {
					TextField("Username", text: $username)
					TextField("Username", text: $fullName)
						.textFieldStyle(PlainTextFieldStyle())
						.font(.system(size: 11, design: .monospaced))
						.padding(5)
						.padding(.leading, 10)
						.background(RoundedRectangle(cornerRadius: 2).stroke(Color.white))
				}
			}.frame(width: 184)
		}
		.textFieldStyle(.roundedBorder)
		
	}
}

// https://stackoverflow.com/questions/60284197/swiftui-customized-text-field-in-osx
