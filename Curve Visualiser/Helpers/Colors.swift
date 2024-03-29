//
//  Colors.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import Foundation
import SwiftUI

public class Colors {
	static let primary: Color = Color(red: 0.69, green: 0.32, blue: 0.87)
	static let primaryGradientStart: Color = Color(red: 0.69, green: 0.32, blue: 0.87, opacity: 0.15)
	static let primaryGradientStop: Color = Color(red: 0.69, green: 0.32, blue: 0.87, opacity: 0)
	
	static let darkGray: Color = Color(red: 0.20, green: 0.20, blue: 0.20)
	static let secondary: Color = Color(red: 0.33, green: 0.33, blue: 0.33)
	static let text: Color = Color(red: 0.5, green: 0.5, blue: 0.5)
	
	static let stroke: Color = Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 0.1)
	static let shadow: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.25)
	static let background: Color = Color(red: 0.11, green: 0.11, blue: 0.11)
	static let grid: Color = Color(red: 0.15, green: 0.15, blue: 0.15)
}
