//
//  CurveEditorView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct CurveEditorView: View {
		@EnvironmentObject var appState: AppState
		
		// MARK: Shape values
		var body: some View {
				return ZStack(alignment: .center) {
						RoundedRectangle(cornerRadius: 6)
							.frame(width: 120, height: 120)
							.foregroundColor(Colors.darkGray)
							.overlay(
								RoundedRectangle(cornerRadius: 6)
									.stroke(Colors.stroke, lineWidth: 1)
							)
							.shadow(color: Colors.shadow, radius: 14, x: 0, y: 4)

						CurveShape(
							cp0:
								CGPoint(x: appState.values.first, y: 1.0 - appState.values.second),
							cp1:
								CGPoint(x: appState.values.third, y: 1.0 - Double(appState.values.fourth))
						)
							.stroke(Colors.primary, lineWidth: 4)
							.frame(width: 116, height: 116)
							.shadow(color: Colors.primary, radius: 10, x: 0, y: 0)
							.zIndex(1)
					
						CurveShape(
							cp0:
								CGPoint(x: 0, y: 1),
							cp1:
								CGPoint(x: 1, y: 0)
						)
							.stroke(Colors.secondary, lineWidth: 2)
				}
				.aspectRatio(contentMode: .fit)
		}
}
