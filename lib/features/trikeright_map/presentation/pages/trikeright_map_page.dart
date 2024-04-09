import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latlng;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/features/trikeright_map/data/openrouteservice_api.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_api_model.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_sliding_up_panel.dart';

class TrikeRightMapPage extends StatefulWidget {
  const TrikeRightMapPage({super.key});

  @override
  State<TrikeRightMapPage> createState() => _TrikeRightMapPageState();
}

class _TrikeRightMapPageState extends State<TrikeRightMapPage> {
  static const latlng.LatLng tagbilaranLatLng =
      latlng.LatLng(9.64697490569609, 123.85528213870656);
  final PanelController panelController = PanelController();

  RouteResponseApiModel routeResponseApiModel = RouteResponseApiModel();
  List<latlng.LatLng> points = [];

  getCoordinates(String startPoint, String endPoint) async {
    var response =
        await http.get(OpenRouteServiceApi.getRouteUrl(startPoint, endPoint));
    setState(() {
      if (response.statusCode == 200) {
        routeResponseApiModel = responseApiModelFromJson(response.body);
        debugPrint(responseApiModelToJson(routeResponseApiModel));
        points = routeResponseApiModel.features![0].geometry!.coordinates!
            .map((e) => latlng.LatLng(e[1].toDouble(), e[0].toDouble()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        // AppBar - Trike Right
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18.r),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'TrikeRight',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0F1416),
              fontSize: 18.sp,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: const Color(0xFFF7FAFC),
        ),
        // Sliding Up Panel
        body: SlidingUpPanel(
          controller: panelController,
          minHeight: ScreenUtil().screenHeight * 0.220,
          maxHeight: ScreenUtil().screenHeight * 0.45,
          color: const Color(0xFFF7FAFC),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(18.r),
          ),
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          // Google Map
          body: _buildMap(),
          // Sliding Up Panel Builder
          panelBuilder: (controller) => MySlidingUpPanel(
            controller: controller,
            panelController: panelController,
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: const Color(0xFFF7FAFC),
        //   onPressed: () => getCoordinates("123.8566351246631,9.660094060006394",
        //       "123.85528213870656,9.64697490569609"),
        //   child: const Icon(Icons.directions),
        // ),
      ),
    );
  }

  FlutterMap _buildMap() {
    return FlutterMap(
      options: const MapOptions(
        interactionOptions: InteractionOptions(),
        initialCenter: tagbilaranLatLng,
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        const MarkerLayer(
          markers: [
            Marker(
              point: latlng.LatLng(9.66038, 123.85647),
              child: Icon(
                Icons.location_on,
                color: Colors.red,
                size: 30,
              ),
            ),
            Marker(
              point: tagbilaranLatLng,
              child: Icon(
                Icons.location_on,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
        PolylineLayer(
          polylineCulling: false,
          polylines: [
            Polyline(
              points: points,
              strokeWidth: 5,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
