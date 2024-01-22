import Cocoa
import FlutterMacOS

let tabModel: TabModel = .init()

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "floating_tab_bar.method_channel", binaryMessenger: controller.engine.binaryMessenger)

        tabModel.channel = channel
        channel.setMethodCallHandler(methodHandler)
    }

    public func methodHandler(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let methodName: String = call.method

        switch methodName {
        case "toggleTabBarVisibility":
            tabModel.toggleVisibility()
            result(true)
        default: break
        }
    }
}
