import Foundation

public typealias Calls = [String: Call]
public typealias Template = Call
public typealias Templates = [String: Template]

public struct Call: Decodable {
  public var host: String
  public var method: String
  public var endpoint: String
  public var headers: [String: String]
  public var options: [String: String]
  public var signed: Bool

  public mutating func set(option: String, to value: String) {
    options[option] = value
  }

  public mutating func set(options newOptions: [String: String]) {
    for (key, value) in newOptions {
      options[key] = value
    }
  }

  public static func from(template name: String, in templates: Templates) -> Call? {
    let call = templates[name]
    return call
  }
}
