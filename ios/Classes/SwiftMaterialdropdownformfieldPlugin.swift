import Flutter
import UIKit

public class SwiftMaterialdropdownformfieldPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "materialdropdownformfield", binaryMessenger: registrar.messenger())
    let instance = SwiftMaterialdropdownformfieldPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
