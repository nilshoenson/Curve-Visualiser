//
//  TimingCurveView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 19/01/2022.
//

import SwiftUI

struct TimingCurveView: View {
		@State var value: CGFloat = 0
		@StateObject var appState = AppState()
		
		/// Animations
		var loopingAnimation: Animation {
			if (appState.animationLooping) {
				// Looping animation
				return Animation.timingCurve(
					appState.values.first,
					appState.values.second,
					appState.values.third,
					appState.values.fourth,
					duration: Double(appState.duration)
			 ).repeatForever(autoreverses: false)
			} else {
				// Reset loop animation
				return Animation.timingCurve(0,0,0,0,duration: 0)
			}
		}
	
		var singleAnimation: Animation {
			// Single animation
			Animation.timingCurve(
				appState.values.first,
				appState.values.second,
				appState.values.third,
				appState.values.fourth,
				duration: Double(appState.duration)
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
					.onChange(of: appState.animationPlaying) { newValue in
						self.value = 0
						
						withAnimation(self.singleAnimation){
							self.value = 1
							self.appState.animationPlaying = false
						}
					}
					.onChange(of: appState.animationLooping) { newValue in
						if (newValue == true) {
							self.value = 0
							
							withAnimation(self.loopingAnimation) {
								self.value = 1
							}
						} else {
							withAnimation(self.loopingAnimation) {
								self.value = 0
							}
						}
					}
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
			.environmentObject(appState)
		}
}
