import Foundation

public extension Decodable {

  //MARK: Class Methods
  public static func decode(from filePath: String) throws -> Self {
    let fileURL = URL(fileURLWithPath: filePath)
    let data = try Data(contentsOf: fileURL)
    let model = try JSONDecoder().decode(Self.self, from: data)
    return model
  }
}
