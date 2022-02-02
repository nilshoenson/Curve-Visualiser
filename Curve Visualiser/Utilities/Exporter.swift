//
//  Exporter.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/01/2022.
//

import Foundation
import SwiftUI

class Exporter {
	static func toSwiftUi(values: CurveValues, duration: Double) -> String {
		return """
		Animation.timingCurve(\(values.first), \(values.second), \(values.third), \(values.fourth), duration: \(duration))
		"""
	}
	
	static func toCSS(values: CurveValues, duration: Double) -> String {
		return """
		.curve {
			transition: transform \(duration)s cubic-bezier(\(values.first), \(values.second), \(values.third), \(values.fourth));
		}
		"""
	}
	
	static func toJSON(values: CurveValues, duration: Double) -> String {
		return """
		{
			"curve": {
				"values": [\(values.first), \(values.second), \(values.third), \(values.fourth)],
				"duration": \(duration)
			}
		}
		"""
	}
}
