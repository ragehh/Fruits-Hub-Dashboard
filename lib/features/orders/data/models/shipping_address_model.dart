import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? addressDetails;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.addressDetails,
    this.city,
    this.email,
  });

  @override
  String toString() {
    return '$address $city $addressDetails ';
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      addressDetails: json['addressDetails'],
      city: json['city'],
      email: json['email'],
    );
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'addressDetails': addressDetails,
      'city': city,
      'email': email,
    };
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      phone: phone,
      address: address,
      addressDetails: addressDetails,
      city: city,
      email: email,
    );
  }
}
