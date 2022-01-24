//
//  AboutView.swift
//  Curve Visualiser
//
//  Created by Nils Hoenson on 24/01/2022.
//



import SwiftUI
import Cocoa
import os.log


fileprivate let logger = Logger(subsystem: "About", category: "")


struct Uberabout {
	static let windowWidth: CGFloat = 268.0
	static let windowHeight: CGFloat = 316.0
}


// MARK: - About View
struct AboutView: View {
		let bundle: Bundle
		var websiteURL: String = ""
		
		private let windowWidth: CGFloat = Uberabout.windowWidth
		private let windowHeight: CGFloat = Uberabout.windowHeight
		private let gradient = Gradient(colors: [Colors.primaryGradientStart, Colors.primaryGradientStop])
	
		@State private var iconHover: Bool = false
		
		var body: some View {
			VStack(alignment: .center, spacing: 0) {
					// App Icon
					ZStack {
						Rectangle()
							.fill(
								LinearGradient(gradient: Gradient(stops: [
									Gradient.Stop(color: Colors.primaryGradientStart, location: 0),
									Gradient.Stop(color: Colors.primaryGradientStop, location: 0.72),
									Gradient.Stop(color: Colors.primaryGradientStop, location: 1)
								]), startPoint: .top, endPoint: .bottom)
							)
							.frame(width: self.windowWidth, height: 200)
						
						Group {
							if let appIcon = NSApp.applicationIconImage {
								Image(nsImage: appIcon)
							}
						}
						.onHover(perform: {state in
							// Animation on hover
							let ani = Animation.easeInOut(duration: 0.2)
							withAnimation(ani, {
								self.iconHover = state
							})
						})
						.onTapGesture(perform: {
							if let url = URL(string: self.websiteURL) {
								NSWorkspace.shared.open(url)
							}
						})
					}
					.scaleEffect(self.iconHover ? 1.03 : 1.0)
					.frame(width: 96.0, height: 96.0)
					.padding([.bottom], 32.0)
					.padding([.top], 40.0)
					
					// App Name
					Text(Bundle.appName)
						.font(.system(size: 25))
						.fontWeight(.bold)
						.padding([.bottom], 6.0)
						.help(Bundle.appName)
					
					// App Version & Build
					HStack(spacing: 4.0) {
						let versionSuffix = NSLocalizedString("Version",  bundle: self.bundle, comment: "")
						Text("\(versionSuffix)\u{00a0}\(Bundle.appVersionMarketing)")
							.font(.system(size: 14))
							.fontWeight(.medium)
							.foregroundColor(Colors.primary)
							.padding([.bottom], 48.0)
							.help("Version number")
					}
				
					Text(Bundle.copyrightHumanReadable)
						.font(.system(size: 12))
						.foregroundColor(Colors.text)
						.frame(maxWidth: 188, alignment: .center)
						.multilineTextAlignment(.center)
						.help(Bundle.copyrightHumanReadable)
				
					Spacer()
				}
				.frame(width: self.windowWidth, height: self.windowHeight)
		}
		
}

// MARK: - Button Style
fileprivate struct UberaboutWindowButtonStyle: ButtonStyle {
		func makeBody(configuration: Configuration) -> some View {
				let color = Color.accentColor
				let pressed = configuration.isPressed
				return configuration.label
						.font(Font.body.weight(.medium))
						.padding([.leading, .trailing], 8.0)
						.padding([.top], 4.0)
						.padding([.bottom], 5.0)
						.background(color.opacity(pressed ? 0.08 : 0.14))
						.foregroundColor(color.opacity(pressed ? 0.8 : 1.0))
						.cornerRadius(5.0)
						
		}
}


// MARK: - Bundle Extension
extension Bundle {
		
		var appName: String {
				if let name = self.infoDictionary?["CFBundleName"] as? String {
						return name
				} else {
						logger.debug("Unable to determine 'appName'")
						return ""
				}
		}
		
		static var appName: String {
				if let name = Bundle.main.infoDictionary?["CFBundleName"] as? String {
						return name
				} else {
						logger.debug("Unable to determine 'appName'")
						return ""
				}
		}
		
		static var appVersionMarketing: String {
				if let name = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
						return name
				} else {
						logger.debug("Unable to determine 'appVersionMarketing'")
						return ""
				}
		}

		static var copyrightHumanReadable: String {
				if let name = Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String {
						return name
				} else {
						logger.debug("Unable to determine 'copyrightHumanReadable'")
						return ""
				}
		}
		
}
