//
//  GridView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct GridView: View {
		var horizontalSpacing: CGFloat = 48
		var verticalSpacing: CGFloat = 48

		var body: some View {
				GeometryReader { geometry in
						Path { path in
								let numberOfHorizontalGridLines = Int(geometry.size.height / self.verticalSpacing)
								let numberOfVerticalGridLines = Int(geometry.size.width / self.horizontalSpacing)
								for index in 0...numberOfVerticalGridLines {
										let vOffset: CGFloat = CGFloat(index) * self.horizontalSpacing
										path.move(to: CGPoint(x: vOffset, y: 0))
										path.addLine(to: CGPoint(x: vOffset, y: geometry.size.height))
								}
								for index in 0...numberOfHorizontalGridLines {
										let hOffset: CGFloat = CGFloat(index) * self.verticalSpacing
										path.move(to: CGPoint(x: 0, y: hOffset))
										path.addLine(to: CGPoint(x: geometry.size.width, y: hOffset))
								}
						}
						.stroke()
				}
		}
}


struct DotView: View {
		let gridWidth: CGFloat
		let color: Color

		var body: some View {
				GeometryReader { geometry in
						Path { path in
							let numberOfHorizontalGridLines = Int(geometry.size.height / self.gridWidth)
							let numberOfVerticalGridLines = Int(geometry.size.width / self.gridWidth)
							for index in 0...numberOfVerticalGridLines {
									let vOffset: CGFloat = CGFloat(index + 1) * self.gridWidth
								
									for index in 0...numberOfHorizontalGridLines {
											let hOffset: CGFloat = CGFloat(index + 1) * self.gridWidth
											path.move(to: CGPoint(x: vOffset, y: hOffset))
											path.addArc(center: CGPoint(x: vOffset, y: hOffset), radius: 1.25, startAngle: .degrees(0), endAngle: .degrees(.pi * 2), clockwise: true)
									}
							}
						}
						.foregroundColor(color)
				}
		}
}
