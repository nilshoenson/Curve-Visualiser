//
//  CircleStyle.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 09/02/2022.
//

import SwiftUI

struct CircleButtonStyle: ButtonStyle {
		private struct CircleButtonStyleView: View {
				let configuration: Configuration

				var body: some View {
						configuration.label
								.padding(.all, 8)
								.background(
										ZStack {
												Circle()
												.fill(.red)
														.shadow(
																color: Color.black.opacity(0.2),
																radius: configuration.isPressed ? 1 : 2,
																x: 0,
																y: configuration.isPressed ? 1 : 2
														)
														.overlay(
																Circle()
																	.stroke(.white)
														)
										}
								)
								.foregroundColor(.green)
								.animation(.easeInOut)
				}
		}

		func makeBody(configuration: Self.Configuration) -> some View {
				CircleButtonStyleView(configuration: configuration)
		}
}
