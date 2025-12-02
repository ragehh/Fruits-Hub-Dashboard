class ShippingAddressEntity {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? addressDetails;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.address,
    this.addressDetails,
    this.city,
    this.email,
  });

  @override
  String toString() {
    return '$address $city $addressDetails';
  }
}
