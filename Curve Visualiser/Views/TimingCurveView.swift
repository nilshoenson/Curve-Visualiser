//
//  TimingCurveView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 19/01/2022.
//

import SwiftUI

struct ButtonThatLookLikeNothingStyle: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.font(.body)
			.padding(.trailing, 3)
			.foregroundColor(Color(NSColor.secondaryLabelColor))
			.background(Color(NSColor.clear))
			.border(Color(NSColor.controlShadowColor), width: 0)
	}
}

struct TimingCurveView: View {
		@State var value: CGFloat = 0
		@ObservedObject var appState: AppState
		
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
				return Animation.timingCurve(0, 0, 0, 0, duration: 0)
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
							AnimationView(
								value: value,
								currentAnimation: appState.animationPlaying ? singleAnimation : loopingAnimation
							)
							.padding(.leading, 20)
							.padding(.trailing, 20)
							.padding(.bottom, 20)
					}
					.zIndex(1)
					.onChange(of: appState.animationPlaying) { newValue in
						self.value = 0
						
						if (newValue == true) {
							self.value = 1
							
							DispatchQueue.main.asyncAfter(deadline: .now() + Double(appState.duration)) {
								self.appState.animationPlaying = false
							}
						}
					}
					.onChange(of: appState.animationLooping) { newValue in
						if (newValue == true) {
							self.value = 1
						} else {
							self.value = 0
						}
					}
					GridView(gridWidth: 12, color: Colors.grid)
					
					HStack {
						Spacer()
						HStack {
							Menu {
								NavigationMenuItems()
							} label: {
								Image("Cog")
									.frame(width: 30, height: 16)
							}
							.menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
							.fixedSize()
						}
						.frame(width: 48, height: 28)
						.background(Colors.darkGray)
						.cornerRadius(24)
						.overlay(
							RoundedRectangle(cornerRadius: 24)
								.stroke(Color.white.opacity(0.08), lineWidth: 1)
						)
						.offset(x: -12, y: 12)
					}
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
