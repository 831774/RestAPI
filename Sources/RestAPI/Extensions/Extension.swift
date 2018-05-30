import Foundation

public extension URLRequest {

  //MARK: Methods
  public mutating func add(_ headers: [String: String]) {
    for (field, value) in headers {
      self.addValue(value, forHTTPHeaderField: field)
    }
  }
}

public extension Date {

  //MARK: Class Methods
  public static func from(unixTimestamp: Int) -> Date {
    let intervalMilliseconds = Double(unixTimestamp)
    let intervalSeconds = intervalMilliseconds / 1000
    let interval = TimeInterval(intervalSeconds)
    let date = Date(timeIntervalSince1970: interval)
    return date
  }

  //MARK: Computed Properties
  public var unixTimestamp: String{
    let milliseconds = self.timeIntervalSince1970 * 1000
    let rounded = Int(milliseconds)
    return String(rounded)
  }

  //MARK: Computed Class Properties
  public static var currentUnixTimestamp: String {
    let milliseconds = Date().timeIntervalSince1970 * 1000
    let rounded = Int(milliseconds)
    return String(rounded)
  }
}
