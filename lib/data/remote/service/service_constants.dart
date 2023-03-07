abstract class ServiceConstant {
  static const baseUrl = String.fromEnvironment('DART_DEFINES_BASE_URL',
      defaultValue: "http://localhost/8080");
  static const version = "/1.0";
  static const timeOut = 30 * 1000;
}

class RequestHeader {
  static const tokenKey = "AUTH_TOKEN";
  static const language = "Lang";
}

class RequestHeaderValue {
  static const langVi = "vi";
  static const langEn = "en";
}

class NetworkRequestValues {
  static const contentType = "application/json";
}
