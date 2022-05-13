class CreateCustomerResponse {
  String? customer;
  String? status;

  CreateCustomerResponse({this.customer, this.status});

  CreateCustomerResponse.fromJson(Map<String, dynamic> json) {
    customer = json['customer'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer'] = this.customer;
    data['status'] = this.status;
    return data;
  }
}
