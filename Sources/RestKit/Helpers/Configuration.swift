import Foundation

public struct Configuration: Codable {

  //MARK: Properties
  public var useDebugging: Bool
  public var showStatusCode: Bool
  public var publicKey: String
  public var secretKey: String

  public static var standard: Configuration {
    let result = Configuration(useDebugging: false, showStatusCode: false, publicKey: "", secretKey: "")
    return result
  }
}
