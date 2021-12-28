//
//  CurveEditorView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct CurveEditorView: View {
		@EnvironmentObject var infos: Infos
		
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
								CGPoint(x: infos.values.first, y: 1.0 - infos.values.second),
							cp1:
								CGPoint(x: infos.values.third, y: 1.0 - Double(infos.values.fourth))
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

struct TimingCurveView: View {
		@State var value: CGFloat = 0
		@StateObject var infos = Infos()

		let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
		
		var animation: Animation {
			Animation.timingCurve(
				infos.values.first,
				infos.values.second,
				infos.values.third,
				infos.values.fourth,
				duration: Double(infos.duration)
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
//						self.value = 0
//						withAnimation(self.animation) {
//							self.value = 1
//						}
//					}
					.onAppear(perform: {
						if (infos.animationPlaying) {
							withAnimation(self.animation) {
								self.value = 1
							}
						}
					 })
					GridView(gridWidth: 12, color: Colors.grid)
				}
				.background(Colors.background)
				
				HStack {
					SettingsView()
				}
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
				.padding(24)
				.overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Colors.stroke), alignment: .top)
				.background(Colors.darkGray)
				.shadow(color: Colors.shadow, radius: 15, x: 0, y: -3)
			}
			.environmentObject(infos)
		}
}
