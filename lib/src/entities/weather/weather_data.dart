import 'dart:math';
import 'package:open_weather_example_flutter/src/entities/temperature.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather.dart';

/// Derived model class used in the UI
class WeatherData {
  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  factory WeatherData.from(Weather weather) {
    return WeatherData(
      temp: Temperature.celsius(weather.weatherParams.temp),
      minTemp: Temperature.celsius(weather.weatherParams.tempMin),
      maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
      description: weather.weatherInfo[0].main,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.weatherInfo[0].icon,
    );
  }

  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  dynamic clearimg = [
    "assets/random_image/Clear_2.png",
    "assets/random_image/Clear.png",
    "assets/random_image/Clear_3.png",
    "assets/random_image/Clear_4.png",
    "assets/random_image/Clear_5.png",
    "assets/random_image/Clear.png",
  ];
  Random rndClear = Random();
  imgclear() {
    int min = 0;
    int max = clearimg.length - 1;
    int r = min + rndClear.nextInt(max - min);
    String image_name = clearimg[r].toString();
    return (image_name);
  }

  dynamic mistimg = [
    "assets/random_image/Mist.png",
    "assets/random_image/Mist_2.png",
    "assets/random_image/Mist.png",
    "assets/random_image/Mist_2.png",
  ];
  Random rndmist = Random();
  imgmist() {
    int min = 0;
    int max = mistimg.length - 1;
    int r = min + rndmist.nextInt(max - min);
    String image_name = mistimg[r].toString();
    return (image_name);
  }

  dynamic rainimg = [
    "assets/random_image/Rain.png",
    "assets/random_image/Rain_1.png",
    "assets/random_image/Rain_2.png",
    "assets/random_image/Rain.png",
  ];
  Random rndrain = Random();
  imgrain() {
    int min = 0;
    int max = rainimg.length - 1;
    int r = min + rndrain.nextInt(max - min);
    String image_name = rainimg[r].toString();
    return (image_name);
  }

  dynamic snowimg = [
    "assets/random_image/Snow.png",
    "assets/random_image/Snow_1.png",
    "assets/random_image/Snow_2.png",
    "assets/random_image/Snow.png",
  ];
  late Random rndsnow = Random();
  imgsnow() {
    int min = 0;
    int max = snowimg.length - 1;
    int r = min + rndsnow.nextInt(max - min);
    String image_name = snowimg[r].toString();
    return image_name;
  }

  dynamic fogimg = [
    "assets/random_image/Fog.png",
    "assets/random_image/Fog_1.png",
    "assets/random_image/Fog_2.png",
    "assets/random_image/Fog.png",
  ];
  Random rndfog = Random();
  imgfog() {
    int min = 0;
    int max = fogimg.length - 1;
    int r = min + rndfog.nextInt(max - min);
    String image_name = fogimg[r].toString();
    return (image_name);
  }

  dynamic cloudsimg = [
    "assets/random_image/Clouds_1.png",
    "assets/random_image/Clouds.png",
    "assets/random_image/Clouds_1.png",
    "assets/random_image/Clouds.png",
  ];
  late Random rndclouds = Random();
  imgclouds() {
    int min = 0;
    int max = cloudsimg.length - 1;
    int r = min + rndclouds.nextInt(max - min);
    String image_name = cloudsimg[r].toString();
    return image_name;
  }

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
  String findMainIcon() {
    switch (description) {
      case "Clear":
        return imgclear();
      case "Clouds":
        return imgclouds();
      case "Drizzle":
        return imgrain();
      case "Fog":
        return imgfog();
      case "Mist":
        return imgmist();
      case "Haze":
        return "assets/random_image/Haze.png";
      case "Rain":
        return imgrain();
      case "Snow":
        return imgsnow();
      case "Thunderstorm":
        return "assets/random_image/Thunderstorm.png";
      default:
        return imgclear();
    }
  }

  String findIcon() {
    switch (description) {
      case "Clear":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Clear.png";
          }
          return "assets/images/Clear_2.png";
        } else {
          return "assets/images/Clear.png";
        }
      case "Clouds":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Clouds.png";
          }
          return "assets/images/Clouds_2.png";
        } else {
          return "assets/images/Clouds.png";
        }
      case "Drizzle":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Rain.png";
          }
          return "assets/images/Rain_2.png";
        } else {
          return "assets/images/Rain.png";
        }
      case "Rain":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Rain.png";
          }
          return "assets/images/Rain_2.png";
        } else {
          return "assets/images/Rain.png";
        }
      case "Snow":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Snow.png";
          }
          return "assets/images/Snow_2.png";
        } else {
          return "assets/images/Snow.png";
        }
      case "Thunderstorm":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Thunderstorm.png";
          }
          return "assets/images/Thunderstorm_2.png";
        } else {
          return "assets/images/Thunderstorm.png";
        }
      case "Mist":
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Mist.png";
          }
          return "assets/images/Mist_2.png";
        } else {
          return "assets/images/Mist.png";
        }
      default:
        if (date.hour >= 19 || date.hour >= 00) {
          if (date.hour == 06 ||
              date.hour == 09 ||
              date.hour == 12 ||
              date.hour == 15 ||
              date.hour == 18) {
            return "assets/images/Clear.png";
          }
          return "assets/images/Clear_2.png";
        } else {
          return "assets/images/Clear.png";
        }
    }
  }

  String findIconDay() {
    switch (description) {
      case "Clear":
        return "assets/images/Clear.png";

      case "Clouds":
        return "assets/images/Clouds.png";

      case "Drizzle":
        return "assets/images/Rain.png";

      case "Rain":
        return "assets/images/Rain.png";

      case "Snow":
        return "assets/images/Snow.png";

      case "Thunderstorm":
        return "assets/images/Thunderstorm.png";

      case "Mist":
        return "assets/images/Mist.png";

      default:
        return "assets/images/Clear.png";
    }
  }

  dynamic jacketimg = [
    "assets/clothes/jacket.png",
    "assets/clothes/sweatshirt.png",
    "assets/clothes/jacket.png",
    "assets/clothes/sweatshirt.png",
  ];
  late Random rndjackets = Random();
  imgjackets() {
    int min = 0;
    int max = jacketimg.length - 1;
    int r = min + rndjackets.nextInt(max - min);
    String image_name = jacketimg[r].toString();
    return image_name;
  }

  dynamic shirtimg = [
    "assets/clothes/shirt.png",
    "assets/clothes/pajamas.png",
    "assets/clothes/overall.png",
    "assets/clothes/baby-clothes.png",
  ];
  late Random rndshirts = Random();
  imgshirts() {
    int min = 0;
    int max = shirtimg.length - 1;
    int r = min + rndshirts.nextInt(max - min);
    String image_name = shirtimg[r].toString();
    return image_name;
  }

  headClothes() {
    if (temp.celsius <= 10) {
      return "assets/clothes/winter-hat.png";
    } else if (temp.celsius > 10 && temp.celsius <= 15) {
      return "assets/clothes/winter-hat (1).png";
    } else if (temp.celsius > 15 && temp.celsius <= 20) {
      return "assets/clothes/hat.png";
    } else
      return "assets/clothes/hat.png";
  }

  upperClothes() {
    if (temp.celsius > 10 && temp.celsius <= 15) {
      return imgjackets();
    } else
      return "none";
  }

  blozeClothes() {
    if (temp.celsius <= 10) {
      return "assets/clothes/pullover.png";
    } else if (temp.celsius > 10 && temp.celsius <= 15) {
      return "assets/clothes/sweater.png";
    } else
      return "none";
  }

  shirtClothes() {
    if (temp.celsius <= 10) {
      return "assets/clothes/polo.png";
    } else if (temp.celsius > 10 && temp.celsius <= 15) {
      return "assets/clothes/vest.png";
    } else if (temp.celsius > 15 && temp.celsius <= 20) {
      return "assets/clothes/shirt.png";
    } else if (temp.celsius > 20) {
      return imgshirts();
    } else
      return "none";
  }

  pantsClothes() {
    if (temp.celsius <= 10) {
      return "assets/clothes/trousers.png";
    } else if (temp.celsius > 10 && temp.celsius <= 15) {
      return "assets/clothes/jeans.png";
    } else if (temp.celsius > 15 && temp.celsius <= 20) {
      return "assets/clothes/trousers (1).png";
    } else if (temp.celsius > 20) {
      return "assets/clothes/pants.png";
    } else
      return "none";
  }

  feetClothes() {
    if (temp.celsius <= 10) {
      return "assets/clothes/socks.png";
    } else if (temp.celsius > 10 && temp.celsius <= 15) {
      return "assets/clothes/socks.png";
    } else if (temp.celsius > 15 && temp.celsius <= 20) {
      return "assets/clothes/socks.png";
    } else if (temp.celsius > 20) {
      return "assets/clothes/socks.png";
    } else
      return "none";
  }
}
