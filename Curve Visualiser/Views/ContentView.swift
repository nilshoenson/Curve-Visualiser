//
//  ContentView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct RecordTimingCurve: GeometryEffect {
		var onChange: (CGFloat) -> () = { _ in () }
		var animatableData: CGFloat = 0 {
				didSet {
						onChange(animatableData)
				}
		}
		
		func effectValue(size: CGSize) -> ProjectionTransform {
				return .init()
		}
}

import Combine

final class AnimationTrace: ObservableObject {
		let objectWillChange = PassthroughSubject<(), Never>()
		var data: [(time: CFTimeInterval, value: CGFloat)] = []
		
		var startTime: CFTimeInterval {
				data.first?.time ?? 0
		}
		
		var endTime: CFTimeInterval {
				data.last?.time ?? 0
		}
				
		func record(_ value: CGFloat) {
				data.append((CACurrentMediaTime(), value))
//        if value == 1 {
						DispatchQueue.main.async {
								print("Data count: \(self.data.count)")
								self.objectWillChange.send()
						}
//        }
		}
		func reset() {
				data = []
		}
}

let animations: [(String, Animation)] = [
		("default", .default),
		("linear(duration: 1)", .linear(duration: 1)),
		("interpolatingSpring(stiffnes: 5, damping: 3)", .interpolatingSpring(stiffness: 5, damping: 3)),
		(".easeInOut(duration: 1)", .easeInOut(duration: 1)),
		(".easeIn(duration: 1)", .easeIn(duration: 1)),
		(".easeOut(duration: 1)", .easeOut(duration: 1)),
		(".interactiveSpring(response: 3, dampingFraction: 2, blendDuration: 1)", .interactiveSpring(response: 3, dampingFraction: 2, blendDuration: 1)),
		(".spring", .spring()),
		(".default.repeatCount(3)", Animation.default.repeatCount(3)),
]

struct ContentView: View {
		@ObservedObject var trace = AnimationTrace()
		@State var animating: Bool = false
		@State var selectedAnimationIndex: Int = 0
		@State var slowAnimations: Bool = false
		var selectedAnimation: (String, Animation) {
				return animations[selectedAnimationIndex]
		}
		var body: some View {
				VStack {
						RoundedRectangle(cornerRadius: 10)
								.fill(Color.pink)
								.frame(width: 50, height: 50)
								.offset(x: animating ? 100 : -100)
								.modifier(RecordTimingCurve(onChange: {
										self.trace.record($0)
								}, animatableData: animating ? 1 : 0))
						
						Spacer()
						Picker(selection: $selectedAnimationIndex, label: EmptyView(), content: {
								ForEach(0..<animations.count) {
										Text(animations[$0].0)
								}
						})
						
						Button(action: {
								self.animating = false
								self.trace.reset()
								withAnimation(self.selectedAnimation.1.speed(self.slowAnimations ? 0.25 : 1), {
										self.animating = true
								})
						}, label: { Text("Animate") })
						Toggle(isOn: $slowAnimations, label: { Text("Slow Animations") })
				}
		}
}
