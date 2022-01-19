//
//  DropdownView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct DropdownView: View {
	@EnvironmentObject var appState: AppState
	
	func changeCurveValues(str: String) {
		switch str {
		case "Linear":
			appState.values.first = 0.0
			appState.values.second = 0.0
			appState.values.third = 1.0
			appState.values.fourth = 1.0
			return
		case "Ease In":
			appState.values.first = 0.0
			appState.values.second = 0.0
			appState.values.third = 0.6
			appState.values.fourth = 0.0
			return
		case "Ease Out":
			appState.values.first = 0.0
			appState.values.second = 0.0
			appState.values.third = 0.4
			appState.values.fourth = 1.0
			return
		case "Ease In Out":
			appState.values.first = 0.0
			appState.values.second = 0.6
			appState.values.third = 1.0
			appState.values.fourth = 0.4
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
				Picker("", selection: $appState.curve) {
					ForEach(Curves.allCases) { curve in
						Text(curve.rawValue).tag(curve)
					}
				}
				.onChange(of: appState.curve) { _ in
					changeCurveValues(str: appState.curve.rawValue)
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
