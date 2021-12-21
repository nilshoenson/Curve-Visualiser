//
//  Shapes.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct CurveShape: Shape {
		let cp0, cp1: CGPoint
		func path(in rect: CGRect) -> Path {
				Path { p in
						p.move(to: CGPoint(x: 0, y: rect.size.height))
						p.addCurve(to: CGPoint(x: rect.size.width, y: 0),
											 control1: cp0 * rect.size,
											 control2: cp1 * rect.size)
				}
		}
}

struct Line: Shape {
		func path(in rect: CGRect) -> Path {
				var path = Path()
				path.move(to: CGPoint(x: 0, y: 0))
				path.addLine(to: CGPoint(x: rect.width, y: 0))
				return path
		}
}
