import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
		// Google Maps Init
		GMSServices.provideAPIKey("AIzaSyDmgO_9mglGeg5-kj_zxKleOfyrTnTiDHg")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
