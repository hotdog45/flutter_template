import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func application(_ app: UIApplication, open url: URL, options:[UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).map(\.path)
        var documentsDirectory = paths.last
        documentsDirectory = (documentsDirectory ?? "") + "/shareFiles"
        
        if url.absoluteString.count > 0 {
            var path = url.absoluteString
            path = path.removingPercentEncoding ?? ""
            var string = path
            if path.hasPrefix("file:///private") {
                let subRange = Range<String.Index>(NSRange(location: 0, length: path.count), in: string)
                string = string.replacingOccurrences(of: "file:///private", with: "", options: .caseInsensitive, range: subRange)
            }
            let tempArray = string.components(separatedBy: "/")
            let fileName = tempArray.last ?? ""
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: documentsDirectory ?? "") {
                do {
                    try fileManager.createDirectory(atPath: documentsDirectory ?? "", withIntermediateDirectories: false, attributes: nil)
                } catch  {
                        
                }
            }
            let filePath = documentsDirectory?.appendingFormat("/%@", fileName)
            if fileManager.fileExists(atPath: filePath ?? "") {
                return true;
            }
            do {
                try fileManager.copyItem(atPath: string, toPath: filePath ?? "")
                try fileManager.removeItem(atPath: string)
            } catch  {
                    
            }
            
        }
            return true;
    }
}
