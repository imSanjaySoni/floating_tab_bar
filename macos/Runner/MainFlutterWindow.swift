import Cocoa
import FlutterMacOS
import SwiftUI

class MainFlutterWindow: NSWindow {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController()
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)

        RegisterGeneratedPlugins(registry: flutterViewController)
        tabModel.addTabBar(self)

        super.awakeFromNib()
    }
}
