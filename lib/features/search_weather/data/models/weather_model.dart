class WeatherModel{
  final double temperature;
  final int condition;
  final double winSpeed;
  WeatherModel({required this.temperature, required this.condition, required this.winSpeed});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
        temperature: json['temperature'],
        condition: json['condition'],
        winSpeed: json['winSpeed'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'temperature': temperature,
      'condition': condition,
      'winSpeed': winSpeed,
    };
  }
}