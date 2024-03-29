//
//  AnimationView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 21/12/2021.
//

import SwiftUI

struct AnimationView: View {	
		var value: CGFloat
		var currentAnimation: Animation?
	
    var body: some View {
			ZStack(alignment: .center) {
				GeometryReader { reader in
					Circle()
						.position(x: 12, y: 12)
						.offset(x: self.value * reader.size.width - self.value * 24, y: 0)
						.frame(width: 24, height: 24)
						.foregroundColor(Colors.primary)
						.accessibilityLabel("Animation")
						.animation(currentAnimation, value: self.value)
				}
				Line()
					.stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
					.frame(height: 2)
					.foregroundColor(Colors.secondary)
					.zIndex(-1)
			}
			.padding(6)
			.frame(height: 36)
			.background(Colors.darkGray)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Colors.stroke, lineWidth: 1)
			)
			.shadow(color: Colors.shadow, radius: 14, x: 0, y: 4)
			.cornerRadius(20)
    }
}


