//
//  InputView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct InputView: View {
	@State private var first: String = ""
	@State private var second: String = ""
	@State private var third: String = ""
	@State private var fourth: String = ""
	
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
					TextField("0.17", text: $first)
					TextField("0.67", text: $second)
				}
				HStack(spacing: spacing) {
					TextField("0.83", text: $third)
					TextField("1", text: $fourth)
				}
			}.frame(width: 224)
		}
		.textFieldStyle(CustomTextFieldStyle())
		.controlSize(.large)
	}
}
