import Foundation

public class GenericAPI: Restful {

  //MARK: Properties
  public let config: Configuration
  public let session: URLSession = URLSession.shared

  //MARK: Initializer
  public init(with config: Configuration) {
    self.config = config
  }

  //MARK: Methods
  public func request(using call: Call) -> URLRequest {
    let path = call.host + call.endpoint + fullQuery(from: call.options)
    let url = URL(string: path)!

    //Request w/params + method
    var request = URLRequest(url: url)
    request.add(call.headers)
    request.httpMethod = call.method
    return request
  }
}
