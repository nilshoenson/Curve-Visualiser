//
//  ContentView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 20/12/2021.
//

import SwiftUI

struct ContentView: View {
		var body: some View {
				Text("Hello, World!")
						.frame(maxWidth: .infinity, maxHeight: .infinity)
						.preferredColorScheme(.dark)
		}
}


struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
				TimingCurveView()
						.frame(width: 400)
		}
}
