class WeatherData{
  //tell the values
  //define a constructor
  //factory
  //map
  WeatherData({
    required this.name,
  });
  String name; 
  factory WeatherData.fromJson(Map <String,dynamic> json) =>
      WeatherData(name: json['name']);
}
