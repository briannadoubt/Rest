//
//  RestClientTests.swift
//  RestTests
//
//  Created by Brianna Zamora on 5/27/23.
//

import XCTest
@testable import Rest

final class RestClientTests: XCTestCase {

    var baseUrl: URL!
    var session: TestURLSession!
    var client: TestClient!

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    let model = TestModel(name: "name")
    var expectedResponse: HTTPURLResponse? {
        HTTPURLResponse(url: baseUrl, statusCode: 200, httpVersion: nil, headerFields: nil)
    }

    func encodedModel() throws -> Data {
        try encoder.encode(model)
    }

    override func setUpWithError() throws {
        baseUrl = try XCTUnwrap(URL(string: "https://www.example.com"))
        session = TestURLSession()
        session.data = try encodedModel()
        session.response = expectedResponse
        client = TestClient(baseUrl: baseUrl, session: session)
    }

    override func tearDownWithError() throws {
        client = nil
        session.data = nil
        session.response = nil
        session = nil
        baseUrl = nil
    }

    func test_get() async throws {
        let responseModel: TestModel = try await client.get()
        XCTAssertEqual(responseModel, model)
    }

    func test_post() async throws {
        let responseModel: TestModel = try await client.post(body: model)
        XCTAssertEqual(responseModel, model)
    }

    func test_post_withBody() async throws {
        let responseModel: TestModel = try await client.post(body: model)
        XCTAssertEqual(responseModel, model)
    }

    func test_put_withBody() async throws {
        let responseModel: TestModel = try await client.put(body: model)
        XCTAssertEqual(responseModel, model)
    }

    func test_request() async throws {
        let responseModel: TestModel = try await client.request(method: "GET")
        XCTAssertEqual(responseModel, model)
    }

    func test_request_withBody() async throws {
        let responseModel: TestModel = try await client.request(method: "POST", body: model)
        XCTAssertEqual(responseModel, model)
    }

    func test_url() async throws {
        let path = "path"
        let query = [URLQueryItem(name: "foo", value: "bar")]
        let url = try await client.url(path: path, query: query)
        let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: false), "URL should be valid for instantiating URLComponents")
        XCTAssertEqual(components.path, path, "URL path should match \"\(path)\"")
        XCTAssertEqual(components.queryItems, query, "URL query parameters should match")
    }

    func test_urlRequest() async throws {
        let headers = ["foo": "bar"]
        let url = await client.baseUrl
        let request = try await client.urlRequest(
            url: url,
            headers: headers,
            timeout: 0.3,
            cachePolicy: .useProtocolCachePolicy
        )
        XCTAssertEqual(request.allHTTPHeaderFields, headers, "Request header fields should match input header fields")
        XCTAssertEqual(request.url, url, "Request's URL should match the input URL")
        XCTAssertEqual(request.timeoutInterval, 0.3, "Request `timeoutInterval` should be set to `0.3`")
        XCTAssertEqual(request.cachePolicy, .useProtocolCachePolicy, "Request `cachePolicy` should be set to `.useProtocolCachePolicy`")
    }

    func test_urlRequest_withBody() async throws {
        let headers = ["foo": "bar"]
        let url = await client.baseUrl
        let request = try await client.urlRequest(
            url: url,
            headers: headers,
            body: model,
            timeout: 0.3,
            cachePolicy: .useProtocolCachePolicy,
            encoder: encoder
        )
        XCTAssertEqual(request.allHTTPHeaderFields, headers, "Request header fields should match input header fields")
        let httpBody = try XCTUnwrap(request.httpBody, "Request body should not be nil")
        let decodedBody = try decoder.decode(TestModel.self, from: httpBody)
        XCTAssertEqual(decodedBody, model, "Request body should match the input body test object")
        XCTAssertEqual(request.url, url, "Request's URL should match the input URL")
        XCTAssertEqual(request.timeoutInterval, 0.3, "Request `timeoutInterval` should be set to `0.3`")
        XCTAssertEqual(request.cachePolicy, .useProtocolCachePolicy, "Request `cachePolicy` should be set to `.useProtocolCachePolicy`")
    }

    func test_response() async throws {
        let request = URLRequest(url: baseUrl)
        let (data, httpResponse) = try await client.response(from: request)

        let decodedBody = try decoder.decode(TestModel.self, from: data)
        XCTAssertEqual(decodedBody, model, "Decoded body should match expected body")

        XCTAssertEqual(httpResponse.statusCode, expectedResponse?.statusCode, "Response statusCode should match the stubbed response statusCode")
        XCTAssertEqual(httpResponse.url, expectedResponse?.url, "Response url should match the stubbed response url")
        XCTAssertEqual(httpResponse.allHeaderFields.keys, expectedResponse?.allHeaderFields.keys, "Response allHeaderFields should match the stubbed response allHeaderFields")
    }

    func test_response_whenUnknownResponseType_shouldThrow() async throws {
        let expectedResponse = URLResponse()
        session.response = expectedResponse

        let request = URLRequest(url: baseUrl)

        do {
            let (_, _) = try await client.response(from: request)
            XCTFail("Expected client response to throw")
        } catch let error as RestError {
            XCTAssertEqual(error, .badResponseType, "`.badResponseType` error should be thrown")
        } catch {
            XCTFail("An unexpected error was thrown")
        }
    }

    func test_decode() async throws {
        let decodedModel: TestModel = try await client.decode(encodedModel())
        XCTAssertEqual(decodedModel, model)
    }

    func test_validate_httpResponse() async throws {
        let response = try XCTUnwrap(HTTPURLResponse(url: baseUrl, statusCode: 200, httpVersion: nil, headerFields: nil))
        do {
            try await client.validate(httpResponse: response)
        } catch {
            XCTFail("An unexpected error was thrown: \(error)")
        }
    }

    func test_validate_httpResponse_whenStatusCode_isLessThan200_shouldThrow() async throws {
        let expectedStatusCode = 199
        let response = try XCTUnwrap(HTTPURLResponse(url: baseUrl, statusCode: expectedStatusCode, httpVersion: nil, headerFields: nil))
        let expectedData = try encodedModel()
        do {
            try await client.validate(httpResponse: response)
            XCTFail("Expected an error to be thrown")
        } catch let error as RestError {
            XCTAssertEqual(error, .serverError(statusCode: expectedStatusCode, response: expectedData), "Should throw server error with expected status code of 199.")
        } catch {
            XCTFail("An unexpected error was thrown")
        }
    }

    func test_parse_whenStatusCode_isMoreThan299_shouldThrow() async throws {
        let expectedStatusCode = 300
        let response = try XCTUnwrap(HTTPURLResponse(url: baseUrl, statusCode: expectedStatusCode, httpVersion: nil, headerFields: nil))
        let expectedData = try encodedModel()
        do {
            try await client.validate(httpResponse: response)
            XCTFail("Expected an error to be thrown")
        } catch let error as RestError {
            XCTAssertEqual(error, .serverError(statusCode: expectedStatusCode, response: expectedData), "Should throw server error with expected status code of 199.")
        } catch {
            XCTFail("An unexpected error was thrown")
        }
    }
}

struct TestModel: Codable, Equatable {
    var name: String
}

actor TestClient: RestClient {
    var encoder = JSONEncoder()

    var decoder = JSONDecoder()

    var baseUrl: URL

    var session: URLSessionProtocol

    func set(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    init(baseUrl: URL, session: URLSessionProtocol) {
        self.baseUrl = baseUrl
        self.session = session
    }
}

class TestURLSession: URLSessionProtocol {
    var data: Data!
    var response: URLResponse!

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return (data, response)
    }
}

enum TestURLSessionError: LocalizedError {
    case missingMockResponse
}
