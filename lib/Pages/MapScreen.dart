import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
    const MapScreen({Key? key}) : super(key: key);
  
    @override
    State<MapScreen> createState() => _MapScreenState();
  }
  
  class _MapScreenState extends State<MapScreen> {
    static const _positioncamera = CameraPosition(
      target: LatLng(50.62998647192007, 3.056167049079924),
      zoom: 11.5
      );
      

    late GoogleMapController _googleMapController;
    late  MapType _currentMapType = MapType.normal;


    static final Marker _votreposition = Marker(
      markerId: const MarkerId('_yourposition'),
      infoWindow: const InfoWindow(title: 'Votre position !'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(50.62998647192007, 3.056167049079924),
      );

    static final Marker _marker1 = Marker(
      markerId: MarkerId('_marker1'),
      infoWindow: InfoWindow(title: "Musée d'histoire naturellle."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.62720474785038, 3.066846455407347),
      );

      static final Marker _marker2 = Marker(
      markerId: MarkerId('_marker2'),
      infoWindow: InfoWindow(title: "porte de Paris."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.63001587378566, 3.0686931159585202),
      );
      
      static final Marker _marker3 = Marker(
      markerId: MarkerId('_marker3'),
      infoWindow: InfoWindow(title: "La Citadelle de Lille."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.64001630121305, 3.0465195291198137),
      );

      static final Marker _marker4 = Marker(
      markerId: MarkerId('_marker4'),
      infoWindow: InfoWindow(title: "CHU de Lille."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.611855201896866, 3.0347930194849773),
      );
      static final Marker _marker5 = Marker(
      markerId: MarkerId('_marker5'),
      infoWindow: InfoWindow(title: "Cathédrale Notre Dame."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.64039943114424, 3.0623367550341154),
      );

      static final Marker _marker6 = Marker(
      markerId: MarkerId('_marker6'),
      infoWindow: InfoWindow(title: "Marché de Wazemmes."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.62776195446704, 3.0499177399622055),
      );

      static final Marker _marker7 = Marker(
      markerId: MarkerId('_marker7'),
      infoWindow: InfoWindow(title: "Gare d'Europe."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(50.64046609354359, 3.0750415712307944
),
      );


    @override
    void dispose(){
      _googleMapController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Votre Ville"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 16, 146),
        actions: [
          TextButton(child: const Text("Hybrid"),
                          onPressed: ()=> 
                          {
                             setState(() {
                                _currentMapType = (_currentMapType == MapType.normal) ? MapType.hybrid : MapType.normal;  
                             })
                          },
                        ),
        ],
      ),
        body:   GoogleMap(
          mapType: _currentMapType,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _positioncamera,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            _votreposition,
            _marker1,
            _marker2,
            _marker3,
            _marker4,
            _marker5,
            _marker6,
            _marker7,
          },
        

          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_positioncamera)
              ),
              child: const Icon(Icons.center_focus_strong),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          
    );

 
  }







  
  



  