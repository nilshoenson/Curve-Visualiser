//
//  DurationView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct DurationView: View {
	@EnvironmentObject var infos: Infos
	
	let spacing: CGFloat = 10
	
	var body: some View {
		HStack(alignment: .top, spacing: 12) {
			HStack {
				Spacer()
				Text("Duration")
					.font(.system(size: 12))
					.fontWeight(.semibold)
					.foregroundColor(Color.white)
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			.frame(width: 60, height: 28)
			
			VStack(spacing: spacing) {
				TextField("Seconds", text: Binding(
					get: { String(infos.duration) },
					set: { infos.duration = Int($0) ?? 0 }
				))
			}.frame(width: 224)
		}
		.textFieldStyle(CustomTextFieldStyle())
		.controlSize(.large)
	}
}
