import Foundation

public protocol Restful {
  var config: Configuration { get }
  var session: URLSession { get }
  func request(using parameters: Call) -> URLRequest
}

extension Restful {

  //MARK: Methods
  public func send(_ request: URLRequest, dataReceived: @escaping (Data) -> Void) {

    let task = session.dataTask(with: request) {
      data, response, error in

      if let error = error { print(error) }
      if let data = data { dataReceived(data) }
      if let response = response {
        if self.config.useDebugging { print(response) }
      }

    }

    task.resume()
  }

  public func model<Model: Decodable>(_ call: Call, model: Model.Type, callback: @escaping (Model) -> Void) {
    let request = self.request(using: call)
    send(request) { responseData in
      do {
        let result = try JSONDecoder().decode(model, from: responseData)
        callback(result)
      } catch {
        print("Decoding Error: \(error)")
      }
    }
  }

  public func data(_ call: Call, callback: @escaping (Data) -> Void) {
    let request = self.request(using: call)
    send(request) { responseData in
      callback(responseData)
    }
  }

  public func rawJSON(_ call: Call, callback: @escaping (Any?) -> Void) {
    let request = self.request(using: call)
    send(request) { responseData in
      let json = try? JSONSerialization.jsonObject(with: responseData)
      callback(json)
    }
  }
  //query with leading question mark (for actual use in a path)
  public func fullQuery(from options: [String: String]) -> String {
    var query = self.truncatedQuery(from: options)
    if !query.isEmpty {
      query = "?" + query
    }
    return query
  }

  public func truncatedQuery(from options: [String: String]) -> String {
    var result = String()
    let indexOfLastElement = options.count - 1
    for (index, element) in options.enumerated() {
      result += element.key
      result += "="
      result += element.value
      if index < indexOfLastElement {
        result += "&"
      }
    }
    return result
  }

}
