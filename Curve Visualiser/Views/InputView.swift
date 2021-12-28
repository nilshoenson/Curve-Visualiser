//
//  InputView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct Input: View {
	@State private var enteredValue : String = ""
	@EnvironmentObject var infos: Infos
	@Binding var value: Double
	let label: String
	
	func isDisabled(str: String) -> Bool {
		switch str {
		case "Linear", "Ease In", "Ease Out", "Ease In Out":
			return true
		default:
			return false
		}
	}
	
	var body: some View {
		TextField("\(label)", text: Binding(
			get: { String(value) },
			set: { value = Double($0) ?? 0 }
		))
		.disabled(isDisabled(str: infos.curve.rawValue))
		.textFieldStyle(CustomTextFieldStyle())
		.controlSize(.large)
	}
}

struct InputView: View {
	@EnvironmentObject var infos: Infos
	
	let spacing: CGFloat = 10
	
	var body: some View {
		HStack(alignment: .top, spacing: 12) {
			HStack {
				Spacer()
				Text("Values")
					.font(.system(size: 12))
					.fontWeight(.semibold)
					.foregroundColor(Color.white)
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			.frame(width: 60, height: 28)
			
			VStack(spacing: spacing) {
				HStack(spacing: spacing) {
					Input(value: $infos.values.first, label: "0.17")
					Input(value: $infos.values.second, label: "0.67")
				}
				HStack(spacing: spacing) {
					Input(value: $infos.values.third, label: "0.83")
					Input(value: $infos.values.fourth, label: "1")
				}
			}.frame(width: 224)
		}
	}
}
