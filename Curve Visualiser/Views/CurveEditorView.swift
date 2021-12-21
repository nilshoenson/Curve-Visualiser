//
//  CurveEditorView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct CurveEditorView: View {
		// MARK: Shape values
		// Curve
		// cubic-bezier(.17,.67,.83,.33)
		private let initialPoint0: CGSize = .init(width: 0.17, height: 0.33)
		private let initialPoint1: CGSize = .init(width: 0.83, height: 0.67)

		private var curveStart: CGPoint { (initialPoint0).toPoint }
		private var curveEnd: CGPoint { (initialPoint1).toPoint }
	
		// Axis indicator
		private let initialLine0: CGSize = .init(width: 0, height: 1)
		private let initialLine1: CGSize = .init(width: 1, height: 0)
	
		private var bottomLeft: CGPoint { (initialLine0).toPoint }
		private var topRight: CGPoint { (initialLine1).toPoint }

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

						CurveShape(cp0: self.curveStart, cp1: self.curveEnd)
							.stroke(Colors.primary, lineWidth: 4)
							.frame(width: 116, height: 116)
							.shadow(color: Colors.primary, radius: 10, x: 0, y: 0)
							.zIndex(1)
					
						CurveShape(cp0: self.bottomLeft, cp1: self.topRight)
							.stroke(Colors.secondary, lineWidth: 2)
				}
				.aspectRatio(contentMode: .fit)
				.preferredColorScheme(.dark)
		}
}

struct TimingCurveView: View {
		@State var value: CGFloat = 0

		let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
		
		var animation: Animation {
				Animation.timingCurve(
						0.17,0.67,0.83,0.33,
						duration: 2
				)
		}

		var body: some View {
			VStack(spacing: 0) {
				ZStack(alignment: .top) {
					VStack(spacing:0) {
							CurveEditorView()
									.aspectRatio(contentMode: .fill)
									.frame(width: 160, height: 160)
									.padding(40)
							AnimationView(value: value)
					}
					.zIndex(1)
//					.onReceive(timer) { _ in
//							self.value = 0
//							withAnimation(self.animation) {
//									self.value = 1
//							}
//					}
					DotView(gridWidth: 12, color: Colors.grid)
				}
				.background(Colors.background)
				
				HStack {
					SettingsView()
				}
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
				.padding(20)
				.overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Colors.stroke), alignment: .top)
				.background(Colors.darkGray)
				.shadow(color: Colors.shadow, radius: 15, x: 0, y: -3)
			}
		}
}
