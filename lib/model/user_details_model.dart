class UserDetialsModel {
  final String name;
  final String address;

  UserDetialsModel({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> getJson() => {'name': name, 'address': address};

  factory UserDetialsModel.getModelFromJson(Map<String, dynamic> json) {
    return UserDetialsModel(name: json['name'], address: json['address']);
  }
}
