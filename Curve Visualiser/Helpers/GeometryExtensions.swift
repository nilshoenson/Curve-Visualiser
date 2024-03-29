//
//  GeometryExtensions.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import Foundation

// Just for clarity of intention
typealias AbsolutePoint = CGPoint

func * (lhs: CGSize, rhs: CGSize) -> CGSize {
		.init(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
}

func * (lhs: CGPoint, rhs: CGSize) -> CGPoint {
		.init(x: lhs.x * rhs.width, y: lhs.y * rhs.height)
}

func - (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
		.init(x: lhs.x - rhs, y: lhs.y - rhs)
}

func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		.init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

func + (lhs: CGSize, rhs: CGSize) -> CGSize {
		.init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

func / (lhs: CGSize, rhs: CGSize) -> CGSize {
		.init(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
}

extension CGSize {
		var toPoint: CGPoint { .init(x: width, y: height) }
		var half: CGSize { .init(width: width/2, height: height/2) }
}

