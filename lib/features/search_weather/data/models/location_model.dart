class LocationModel{
  final double latitude;
  final double longitude;
  final String city;
  LocationModel({required this.latitude, required this.longitude, required this.city});

  factory LocationModel.fromJson(Map<String, dynamic> json){
    return LocationModel(
        latitude: json['results'][0]['latitude'],
        longitude: json['results'][0]['longitude'],
        city: json['results'][0]['city'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
    };
  }
}