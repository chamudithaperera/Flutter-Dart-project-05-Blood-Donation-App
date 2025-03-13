import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyCiP6jzuGyiJeJJF1MHAxc6Ou5yFkXyeD4")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
