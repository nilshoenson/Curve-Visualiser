//
//  GridView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct GridView: View {
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
