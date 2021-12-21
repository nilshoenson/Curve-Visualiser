//
//  CurveEditorView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct CurveEditorView: View {
		// cubic-bezier(0,1,1,0)
		// private let initialPoint0: CGSize = .init(width: 0, height: 0)
		// private let initialPoint1: CGSize = .init(width: 1, height: 1)
	
		// cubic-bezier(.17,.67,.83,.33)
		private let initialPoint0: CGSize = .init(width: 0.17, height: 0.33)
		private let initialPoint1: CGSize = .init(width: 0.83, height: 0.67)
	
		// Axis indicator
		private let initialLine0: CGSize = .init(width: 0, height: 1)
		private let initialLine1: CGSize = .init(width: 1, height: 0)

		@State private var offsetPoint0: CGSize = .zero
		@State private var offsetPoint1: CGSize = .zero

		private var curvePoint0: RelativePoint {
				(initialPoint0 + offsetPoint0).toPoint
		}

		private var curvePoint1: RelativePoint {
				(initialPoint1 + offsetPoint1).toPoint
		}
	
		private var line0: RelativePoint {
			(initialLine0 + offsetPoint0).toPoint
		}

		private var line1: RelativePoint {
			(initialLine1 + offsetPoint1).toPoint
		}

		@Binding var controlPoint1: RelativePoint
		@Binding var controlPoint2: RelativePoint

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

						CurveShape(cp0: self.curvePoint0, cp1: self.curvePoint1)
							.stroke(Colors.primary, lineWidth: 4)
							.frame(width: 116, height: 116)
							.shadow(color: Colors.primary, radius: 10, x: 0, y: 0)
							.zIndex(1)
					
						CurveShape(cp0: self.line0, cp1: self.line1)
							.stroke(Colors.secondary, lineWidth: 2)
				}
				.aspectRatio(contentMode: .fit)
				.preferredColorScheme(.dark)
		}
}

struct TimingCurveView: View {
		@State var value: CGFloat = 0

		@State var cp1: RelativePoint = .zero
		@State var cp2: RelativePoint = .zero

		let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
		
		var animation: Animation {
				Animation.timingCurve(
						Double(cp1.x),
						Double(1 - cp1.y),
						Double(cp2.x),
						Double(1 - cp2.y),
						duration: 2
				)
		}

		var body: some View {
			VStack(spacing: 0) {
				ZStack(alignment: .top) {
					VStack(spacing:0) {
							CurveEditorView(controlPoint1: $cp1, controlPoint2: $cp2)
									.aspectRatio(contentMode: .fill)
									.frame(width: 160, height: 160)
									.padding(40)
							AnimationView(value: value)
					}
					.zIndex(1)
					.onReceive(timer) { _ in
							self.value = 0
							withAnimation(self.animation) {
									self.value = 1
							}
					}
					DotView(gridWidth: 12, color: Colors.grid)
				}
				.background(Colors.background)
				
				HStack {
					Text("Here come the controls")
				}
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
				.padding(20)
				.overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Colors.stroke), alignment: .top)
				.background(Colors.darkGray)
				.shadow(color: Colors.shadow, radius: 15, x: 0, y: -3)
			}
		}
}
