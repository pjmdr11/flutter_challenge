class ApiRequestModel {
  String url;
  String? endpoint;
  String? path;
  String? method = httpGet;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? query;
  dynamic body;

  ApiRequestModel(
      {required this.url,
      this.path = httpGet,
      this.headers,
      this.query,
      this.method,
      this.body});
}

const httpGet = "GET";
const httpPost = "POST";
const httpPatch = "PATCH";
const httpDelete = "DELETE";
