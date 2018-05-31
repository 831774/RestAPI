import Foundation

public class RestAPI: Restful {

  //MARK: Properties
  public var config = Configuration.standard
  public let session = URLSession.shared

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
