//
//  Models.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 28/12/2021.
//

import Foundation

final class AppState: ObservableObject {
	@Published var curve = Curves.easeInOut
	@Published var values = CurveValues()
	@Published var duration = 1.0
	@Published var animationPlaying = false
	@Published var animationLooping = false
}

enum Curves: String, CaseIterable, Identifiable {
	var id: String { rawValue }
	
	case linear = "Linear"
	case easeIn = "Ease In"
	case easeOut = "Ease Out"
	case easeInOut = "Ease In Out"
	case custom = "Custom"
}

struct CurveValues {
	// cubic-bezier(0,0.6,1.0,0.4)
	var first = 0.0
	var second = 0.6
	var third = 1.0
	var fourth = 0.4
}
