class UserDetialsModel {
  final String name;
  final String address;

  UserDetialsModel({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> getJson() => {'name': name, 'address': address};
}
