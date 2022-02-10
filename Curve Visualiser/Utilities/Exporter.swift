//
//  Exporter.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/01/2022.
//

import Foundation
import SwiftUI

class Exporter {
	static func toText(values: CurveValues, duration: Double) -> String {
		return """
		(\(values.first), \(values.second), \(values.third), \(values.fourth)), \(duration)
		"""
	}
	
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
	
	static func toJavascript(values: CurveValues, duration: Double) -> String {
		return """
		document.getElementById("curve").animate([
			{ transform: "translateX(0)" },
			{ transform: "translateX(100%)" }
		], {
			duration: \(Int(duration * 1000)),
			easing: cubic-bezier(\(values.first), \(values.second), \(values.third), \(values.fourth))
			iterations: 1
		});
		"""
	}
	
	static func toFramerMotion(values: CurveValues, duration: Double) -> String {
		return """
		import { motion } from "framer-motion"

		export const MyComponent = () => (
			<motion.div
				animate={{ x: '100%' }}
				transition={{
					duration: \(duration),
					transition={{ ease: [\(values.first), \(values.second), \(values.third), \(values.fourth)] }}
				}}
			/>
		)
		"""
	}
}
