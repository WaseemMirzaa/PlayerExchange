class AuthErrorResponse {
  Error? error;

  AuthErrorResponse({this.error});

  AuthErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Error {
  int? statusCode;
  String? name;
  String? message;

  Error({this.statusCode, this.name, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    name = json['name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['name'] = this.name;
    data['message'] = this.message;
    return data;
  }
}
