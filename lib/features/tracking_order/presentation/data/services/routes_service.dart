import 'dart:convert';
import 'package:food/features/tracking_order/presentation/data/model/polyline_utils.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RoutesService {
  final String apiKey;

  RoutesService({required this.apiKey});

  Future<List<LatLng>> getRoutePolyline({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final url = Uri.parse(
      "https://routes.googleapis.com/directions/v2:computeRoutes",
    );

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-Goog-Api-Key": apiKey,
        "X-Goog-FieldMask": """
routes.distanceMeters,
routes.duration,
routes.polyline.encodedPolyline
""",
      },
      body: jsonEncode({
        "origin": {
          "location": {
            "latLng": {
              "latitude": origin.latitude,
              "longitude": origin.longitude,
            },
          },
        },
        "destination": {
          "location": {
            "latLng": {
              "latitude": destination.latitude,
              "longitude": destination.longitude,
            },
          },
        },
        "travelMode": "DRIVE",
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Google Directions Error: ${response.body}");
    }

    final data = jsonDecode(response.body);

    final encodedPolyline =
        data["routes"][0]["polyline"]["encodedPolyline"] as String;

    return PolylineUtils.decode(encodedPolyline);
  }
}
