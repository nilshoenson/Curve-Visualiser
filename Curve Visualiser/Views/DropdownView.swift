//
//  DropdownView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct DropdownView: View {
	@EnvironmentObject var infos: Infos
	
	func changeCurveValues(str: String) {
		switch str {
		case "Linear":
			infos.values.first = 0.0
			infos.values.second = 0.0
			infos.values.third = 1.0
			infos.values.fourth = 1.0
			return
		case "Ease In":
			infos.values.first = 0.0
			infos.values.second = 0.0
			infos.values.third = 0.6
			infos.values.fourth = 0.0
			return
		case "Ease Out":
			infos.values.first = 0.0
			infos.values.second = 0.0
			infos.values.third = 0.4
			infos.values.fourth = 1.0
			return
		case "Ease In Out":
			infos.values.first = 0.0
			infos.values.second = 0.6
			infos.values.third = 1.0
			infos.values.fourth = 0.4
			return
		default:
			return
		}
	}
			
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
				Picker("", selection: $infos.curve) {
					ForEach(Curves.allCases) { curve in
						Text(curve.rawValue).tag(curve)
					}
				}
				.onChange(of: infos.curve) { _ in
					changeCurveValues(str: infos.curve.rawValue)
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
