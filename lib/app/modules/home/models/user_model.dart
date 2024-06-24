class Usermodel {
  Usermodel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? username;
  static const String usernameKey = "username";

  final String? email;
  static const String emailKey = "email";

  final Address? address;
  static const String addressKey = "address";

  final String? phone;
  static const String phoneKey = "phone";

  final String? website;
  static const String websiteKey = "website";

  final Company? company;
  static const String companyKey = "company";

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company:
          json["company"] == null ? null : Company.fromJson(json["company"]),
    );
  }
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String? street;
  static const String streetKey = "street";

  final String? suite;
  static const String suiteKey = "suite";

  final String? city;
  static const String cityKey = "city";

  final String? zipcode;
  static const String zipcodeKey = "zipcode";

  final Geo? geo;
  static const String geoKey = "geo";

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      suite: json["suite"],
      city: json["city"],
      zipcode: json["zipcode"],
      geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
    );
  }
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  final String? lat;
  static const String latKey = "lat";

  final String? lng;
  static const String lngKey = "lng";

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json["lat"],
      lng: json["lng"],
    );
  }
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String? name;
  static const String nameKey = "name";

  final String? catchPhrase;
  static const String catchPhraseKey = "catchPhrase";

  final String? bs;
  static const String bsKey = "bs";

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json["name"],
      catchPhrase: json["catchPhrase"],
      bs: json["bs"],
    );
  }
}
