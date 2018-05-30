import Foundation

public struct Error: Decodable {
  public let code: Int
  public let message: String

  public enum CodingKeys: String, CodingKey {
  case code = "code"
  case message = "msg"
  }

  public func display() {
    print("API returned an error")
    print("Code: \(code)")
    print("Message: \(message)")
  }

  static func check(_ data: Data) -> Error? {
    let error = try? JSONDecoder().decode(Error.self, from: data)
    return error
  }
}
