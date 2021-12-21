//
//  CustomStyles.swift
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

struct CustomTextFieldStyle: TextFieldStyle {
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.textFieldStyle(PlainTextFieldStyle())
			.font(.system(size: 11, design: .monospaced))
			.padding(8)
			.overlay(
				RoundedRectangle(cornerRadius: 6)
					.stroke(Colors.stroke, lineWidth: 1)
			)
			.background(RoundedRectangle(cornerRadius: 6).fill(Colors.secondary))
	}
}
