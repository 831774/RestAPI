import Foundation

public struct Configuration: Codable {

  //MARK: Properties
  public let useDebugging: Bool
  public let showStatusCode: Bool
  public let publicKey: String
  public let secretKey: String
}
