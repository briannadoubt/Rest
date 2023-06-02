//
//  RestClient.swift
//  Rest
//
//  Created by Brianna Zamora on 5/27/23.
//

import Foundation

public protocol RestClient: Actor {
    var baseUrl: URL { get }
    var session: URLSessionProtocol { get }

    var encoder: JSONEncoder { get }
    var decoder: JSONDecoder { get }

    init(baseUrl: URL, session: URLSessionProtocol)
}

extension RestClient {
    
    // MARK: Connect

    /// The **HTTP `CONNECT` method** starts two-way communications with the requested resource. It can be used to open a tunnel.
    ///
    /// For example, the `CONNECT` method can be used to access websites that use [`SSL`](https://developer.mozilla.org/en-US/docs/Glossary/SSL) ([`HTTPS`](https://developer.mozilla.org/en-US/docs/Glossary/HTTPS)). The client asks an `HTTP` [Proxy server](https://developer.mozilla.org/en-US/docs/Glossary/Proxy_server) to tunnel the [TCP](https://developer.mozilla.org/en-US/docs/Glossary/TCP) connection to the desired destination. The server then proceeds to make the connection on behalf of the client. Once the connection has been established by the server, the Proxy server continues to proxy the `TCP` stream to and from the client.
    ///
    /// `CONNECT` is a hop-by-hop method.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    public func connect(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "CONNECT", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: DELETE

    /// The **HTTP `DELETE` request method** deletes the specified resource.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func delete<Body: Encodable, Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(method: "DELETE", path: path, query: query, headers: headers, body: body, cachePolicy: cachePolicy, timeout: timeout)
    }

    /// The **HTTP `DELETE` request method** deletes the specified resource.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func delete<Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(method: "DELETE", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }

    /// The **HTTP `DELETE` request method** deletes the specified resource.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    public func delete<Body: Encodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "DELETE", path: path, query: query, headers: headers, body: body, cachePolicy: cachePolicy, timeout: timeout)
    }

    /// The **HTTP `DELETE` request method** deletes the specified resource.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    public func delete(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "DELETE", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: GET

    /// The **HTTP `GET` method** requests a representation of the specified resource. Requests using `GET` should only be used to request data (they shouldn't include data).
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func get<Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(method: "GET", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: HEAD

    /// The **HTTP `HEAD` method** requests the [headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) that would be returned if the `HEAD` request's URL was instead requested with the HTTP [`GET`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) method. For example, if a URL might produce a large download, a HEAD request could read its [Content-Length](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Length) header to check the filesize without actually downloading the file.
    ///
    /// If the response to a HEAD request shows that a cached URL response is now outdated, the cached copy is invalidated even if no GET request was made.
    ///
    /// - Warning: A response to a `HEAD` method * should not* have a body. If it has one anyway, that body **must be** ignored: any [representation headers](https://developer.mozilla.org/en-US/docs/Glossary/Representation_header) that might describe the erroneous body are instead assumed to describe the response which a similar `GET` request would have received.
    ///
    /// - Parameters:
    ///   - path: If the response to a HEAD request shows that a cached URL response is now outdated, the cached copy is invalidated even if no GET request was made.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    public func head(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "HEAD", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: OPTIONS

    /// The **HTTP `OPTIONS` method** requests permitted communication options for a given URL or server. A client can specify a URL with this method, or an asterisk (`*`) to refer to the entire server.
    /// - Parameters:
    ///   - path: If the response to a HEAD request shows that a cached URL response is now outdated, the cached copy is invalidated even if no GET request was made.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func options<Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(method: "OPTIONS", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: PATCH

    /// The **HTTP `PATCH` request** method applies partial modifications to a resource.
    ///
    /// `PATCH` is somewhat analogous to the "update" concept found in [CRUD](https://developer.mozilla.org/en-US/docs/Glossary/CRUD) (in general, HTTP is different than [CRUD](https://developer.mozilla.org/en-US/docs/Glossary/CRUD), and the two should not be confused).
    ///
    /// A `PATCH` request is considered a set of instructions on how to modify a resource. Contrast this with [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT); which is a complete representation of a resource.
    ///
    /// A `PATCH` is not necessarily idempotent, although it can be. Contrast this with [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT); which is always idempotent. The word "idempotent" means that any number of repeated, identical requests will leave the resource in the same state. For example if an auto-incrementing counter field is an integral part of the resource, then a [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) will naturally overwrite it (since it overwrites everything), but not necessarily so for `PATCH`.
    ///
    /// `PATCH` (like [`POST`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST)) may have side-effects on other resources.
    ///
    /// To find out whether a server supports `PATCH`, a server can advertise its support by adding it to the list in the [`Allow`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Allow) or [`Access-Control-Allow-Methods`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods) (for [`CORS`](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)) response headers.
    ///
    /// Another (implicit) indication that `PATCH` is allowed, is the presence of the [`Accept-Patch`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Patch) header, which specifies the patch document formats accepted by the server.
    /// - Parameters:
    ///   - path: If the response to a HEAD request shows that a cached URL response is now outdated, the cached copy is invalidated even if no GET request was made.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func patch<Body: Encodable, Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(
            method: "PATCH",
            path: path,
            query: query,
            headers: headers,
            body: body,
            cachePolicy: cachePolicy,
            timeout: timeout
        )
    }

    /// The **HTTP `PATCH` request** method applies partial modifications to a resource.
    ///
    /// `PATCH` is somewhat analogous to the "update" concept found in [CRUD](https://developer.mozilla.org/en-US/docs/Glossary/CRUD) (in general, HTTP is different than [CRUD](https://developer.mozilla.org/en-US/docs/Glossary/CRUD), and the two should not be confused).
    ///
    /// A `PATCH` request is considered a set of instructions on how to modify a resource. Contrast this with [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT); which is a complete representation of a resource.
    ///
    /// A `PATCH` is not necessarily idempotent, although it can be. Contrast this with [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT); which is always idempotent. The word "idempotent" means that any number of repeated, identical requests will leave the resource in the same state. For example if an auto-incrementing counter field is an integral part of the resource, then a [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) will naturally overwrite it (since it overwrites everything), but not necessarily so for `PATCH`.
    ///
    /// `PATCH` (like [`POST`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST)) may have side-effects on other resources.
    ///
    /// To find out whether a server supports `PATCH`, a server can advertise its support by adding it to the list in the [`Allow`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Allow) or [`Access-Control-Allow-Methods`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods) (for [`CORS`](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)) response headers.
    ///
    /// Another (implicit) indication that `PATCH` is allowed, is the presence of the [`Accept-Patch`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Patch) header, which specifies the patch document formats accepted by the server.
    /// - Parameters:
    ///   - path: If the response to a HEAD request shows that a cached URL response is now outdated, the cached copy is invalidated even if no GET request was made.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    public func patch<Body: Encodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "PATCH", path: path, query: query, headers: headers, body: body, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: POST

    /// The **HTTP `POST` method** sends data to the server. The type of the body of the request is indicated by the [`Content-Type`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) header.
    ///
    /// The difference between [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) and `POST` is that `PUT` is idempotent: calling it once or several times successively has the same effect (that is no side effect), where successive identical `POST` may have additional effects, like passing an order several times.
    ///
    /// A `POST` request is typically sent via an [HTML form](https://developer.mozilla.org/en-US/docs/Learn/Forms) and results in a change on the server. In this case, the content type is selected by putting the adequate string in the [enctype](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#enctype) attribute of the [`<form>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form) element or the [formenctype](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#formenctype) attribute of the [<input>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input) or [<button>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button) elements:
    ///
    /// * `application/x-www-form-urlencoded`: the keys and values are encoded in key-value tuples separated by `'&'`, with a `'='` between the key and the value. Non-alphanumeric characters in both keys and values are [URL encoded](https://en.wikipedia.org/wiki/URL_encoding): this is the reason why this type is not suitable to use with binary data (use `multipart/form-data` instead)
    /// * `multipart/form-data`: each value is sent as a block of data ("body part"), with a user agent-defined delimiter ("boundary") separating each part. The keys are given in the `Content-Disposition` header of each part.
    /// * `text/plain`
    ///
    /// When the `POST` request is sent via a method other than an HTML form — like via an [`XMLHttpRequest`](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) — the body can take any type. As described in the HTTP 1.1 specification, `POST` is designed to allow a uniform method to cover the following functions:
    ///
    /// * Annotation of existing resources
    /// * Posting a message to a bulletin board, newsgroup, mailing list, or similar group of articles;
    /// * Adding a new user through a signup modal;
    /// * Providing a block of data, such as the result of submitting a form, to a data-handling process;
    /// * Extending a database through an append operation.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    public func post<Body: Encodable, Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(method: "POST", path: path, query: query, headers: headers, body: body, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: PUT

    /// The **HTTP `PUT` request method** creates a new resource or replaces a representation of the target resource with the request payload.
    ///
    /// The difference between `PUT` and [`POST`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) is that `PUT` is idempotent: calling it once or several times successively has the same effect (that is no side effect), whereas successive identical [`POST`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) requests may have additional effects, akin to placing an order several times.
    /// - Parameters:
    ///   - method: The HTTP Method used in the `URLRequest`.
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`
    /// - Returns: The decoded `Response` type.
    public func put<Body: Encodable, Response: Decodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        try await request(method: "PUT", path: path, query: query, headers: headers, body: body, cachePolicy: cachePolicy, timeout: timeout)
    }

    /// The **HTTP `PUT` request method** creates a new resource or replaces a representation of the target resource with the request payload.
    ///
    /// The difference between [`PUT`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) and [`POST`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) is that `PUT` is idempotent: calling it once or several times successively has the same effect (that is no side effect), whereas successive identical [`POST`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) requests may have additional effects, akin to placing an order several times
    /// - Parameters:
    ///   - method: The HTTP Method used in the `URLRequest`.
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`
    public func put<Body: Encodable>(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "PUT", path: path, query: query, headers: headers, body: body, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: TRACE

    /// The HTTP TRACE method performs a message loop-back test along the path to the target resource, providing a useful debugging mechanism.
    ///
    /// The final recipient of the request should reflect the message received, excluding some fields described below, back to the client as the message body of a 200 (OK) response with a Content-Type of message/http. The final recipient is either the origin server or the first server to receive a Max-Forwards value of 0 in the request.
    /// - Parameters:
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`
    public func trace(path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws {
        try await request(method: "TRACE", path: path, query: query, headers: headers, cachePolicy: cachePolicy, timeout: timeout)
    }
    
    // MARK: Generic Request with Body and Response

    /// Create and execute a `URLRequest` with the given parameters. This method includes encoding an `httpBody` into the request.
    /// - Parameters:
    ///   - method: The HTTP Method used in the `URLRequest`.
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`
    /// - Returns: The decoded `Response` type.
    public func request<Body: Encodable, Response: Decodable>(method: String, path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, body: Body, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0, encoder: JSONEncoder = JSONEncoder()) async throws -> Response {
        let request = try urlRequest(url: url(path: path, query: query), headers: headers, body: body, timeout: timeout, cachePolicy: cachePolicy, encoder: encoder)
        let (data, httpResponse) = try await response(from: request)
        try validate(data: data, httpResponse: httpResponse)
        return try decode(data)
    }

    // MARK: Generic Request without Body

    /// Create and execute a `URLRequest` with the given parameters. This method includes encoding an `httpBody` into the request.
    /// - Parameters:
    ///   - method: The HTTP Method used in the `URLRequest`.
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func request<Response: Decodable>(method: String, path: String? = nil, query: [URLQueryItem]? = nil, headers: [String: String]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0) async throws -> Response {
        let request = try urlRequest(
            url: url(path: path, query: query),
            headers: headers,
            timeout: timeout,
            cachePolicy: cachePolicy
        )
        let (data, httpResponse) = try await response(from: request)
        try validate(data: data, httpResponse: httpResponse)
        return try decode(data)
    }

    // MARK: Generic Request without Response

    /// Create and execute a `URLRequest` with the given parameters. This method includes encoding an `httpBody` into the request.
    /// - Parameters:
    ///   - method: The HTTP Method used in the `URLRequest`.
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`
    public func request<Body: Encodable>(
        method: String,
        path: String? = nil,
        query: [URLQueryItem]? = nil,
        headers: [String: String]? = nil,
        body: Body,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeout: TimeInterval = 60.0,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) async throws {
        let request = try urlRequest(
            url: url(path: path, query: query),
            headers: headers,
            body: body,
            timeout: timeout,
            cachePolicy: cachePolicy,
            encoder: encoder
        )
        let (data, httpResponse) = try await response(from: request)
        try validate(data: data, httpResponse: httpResponse)
    }

    // MARK: Generic Request without Body or Response

    /// Create and execute a `URLRequest` with the given parameters. This method includes encoding an `httpBody` into the request.
    /// - Parameters:
    ///   - method: The HTTP Method used in the `URLRequest`.
    ///   - path: The path to be appended to the `URL` in the request.
    ///   - query: The query items to be appended to the `URL` in the request.
    ///   - headers: The headers to be appended to the `URLRequest` before getting executed.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    /// - Returns: The decoded `Response` type.
    public func request(
        method: String,
        path: String? = nil,
        query: [URLQueryItem]? = nil,
        headers: [String: String]? = nil,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeout: TimeInterval = 60.0
    ) async throws {
        let request = try urlRequest(
            url: url(path: path, query: query),
            headers: headers,
            timeout: timeout,
            cachePolicy: cachePolicy
        )
        let (_, httpResponse) = try await response(from: request)
        try validate(httpResponse: httpResponse)
    }

    // MARK: Internal Helpers

    /// Generate a valid `URL` from the given components, relative to `self.baseURL`.
    /// - Parameters:
    ///   - path: The path to be appended to `self.baseUrl`
    ///   - query: The query items to be appended to `self.baseUrl`
    /// - Returns: A valid `URL`.
    ///
    /// If a valid `URL` cannot be generated then this function will throw `RestError.badUrl`
    func url(path: String?, query: [URLQueryItem]?) throws -> URL {
        var components = URLComponents()
        if let path {
            components.path = path
        }
        if let query {
            components.queryItems = query
        }
        guard let url = components.url(relativeTo: baseUrl) else {
            throw RestError.badUrl
        }
        return url
    }

    /// Create a valid `URLRequest` from the given parameters, including a JSON body object.
    /// - Parameters:
    ///   - url: The `URL` used in the request.
    ///   - headers: The headers to append to the `URLRequest`.
    ///   - body: The `httpBody` to be encoded into the request.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    ///   - encoder: The `JSONEncoder` used to encode the body parameter.
    /// - Returns: A valid `URLRequest` that can be used in a `URLSession` to make an HTTP request.
    func urlRequest<Body: Encodable>(
        url: URL,
        headers: [String: String]?,
        body: Body,
        timeout: TimeInterval,
        cachePolicy: URLRequest.CachePolicy,
        encoder: JSONEncoder
    ) throws -> URLRequest {
        var request = URLRequest(
            url: url,
            cachePolicy: cachePolicy,
            timeoutInterval: timeout
        )
        request.httpBody = try encoder.encode(body)
        if let headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }

    /// Create a valid `URLRequest` from the given parameters.
    /// - Parameters:
    ///   - url: The `URL` used in the request.
    ///   - headers: The headers to append to the `URLRequest`.
    ///   - timeout: The `timeoutInterval`set on the `URLRequest`.
    ///   - cachePolicy: The `URLRequest.CachePolicy` set on the `URLRequest`.
    /// - Returns: A valid `URLRequest` that can be used in a `URLSession` to make an HTTP request.
    func urlRequest(
        url: URL,
        headers: [String: String]?,
        timeout: TimeInterval = 60.0,
        cachePolicy: URLRequest.CachePolicy
    ) throws -> URLRequest {
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeout)
        if let headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }

    /// Execute a given response, cast the response as an `HTTPURLResponse` object, and return the `Data` and response object.
    /// - Parameter request: The `URLRequest` to execute.
    /// - Returns: The response, cast as a tuple: `(Data, HTTPURLResponse)`
    ///
    /// If the response returns from the `URLSession` as any type of response other than an `HTTPURLResponse`, this function throws `RestError.badResponseType`
    func response(from request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, urlResponse) = try await session.data(for: request)
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw RestError.badResponseType
        }
        return (data, httpResponse)
    }

    /// Validate the response.
    /// - Parameters:
    ///   - data: The raw response `Data` to throw if needed.
    ///   - httpResponse: The `HTTPURLResponse` object to validate.
    ///
    /// This function checks whether the response's `statusCode` value is less than `200`, or more than or equal to `300`, and if `true`, throws `RestError.serverError(statusCode: httpResponse.statusCode, response: data)`.
    func validate(data: Data? = nil, httpResponse: HTTPURLResponse) throws {
        if httpResponse.statusCode < 200 || httpResponse.statusCode >= 300 {
            throw RestError.serverError(statusCode: httpResponse.statusCode, response: data)
        }
    }

    /// Parse the response and decode it into the expected type.
    /// - Parameters:
    ///   - data: The raw response `Data` to decode.
    ///   - httpResponse: The `HTTPURLResponse` object to parse.
    ///   - decoder: The `JSONDecoder` object used to decode `data`.
    /// - Returns: The decoded `Response` type.
    func decode<Response: Decodable>(_ data: Data) throws -> Response {
        try decoder.decode(Response.self, from: data)
    }
}
