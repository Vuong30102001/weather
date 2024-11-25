class AirQualityModel{
  final int aqi;
  final double pm25;
  AirQualityModel({required this.aqi, required this.pm25});

  factory AirQualityModel.fromJson(Map<String, dynamic> json){
    return AirQualityModel(
        aqi: json['data']['aqi'] as int,
        pm25: json['data']['iaqi']['pm25']['v'] as double,
    );
  }
}