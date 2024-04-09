const String openrouteserviceApiKey =
    '5b3ce3597851110001cf62480cc8ac95b6ed4aa1a36da4adb41196ca';
const String baseUrl =
    'https://api.openrouteservice.org/v2/directions/driving-car';

getRouteUrl(String startPoint, String endPoint) {
  return Uri.parse(
      '$baseUrl?api_key=$openrouteserviceApiKey&start=$startPoint&end=$endPoint');
}
