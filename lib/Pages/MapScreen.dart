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
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_positioncamera)
              ),
              child: const Icon(Icons.center_focus_strong),
          ),
          // floatingActionButton:FloatingActionButton(
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.blue,
          //   onPressed: () => AppSettings.openAppSettings(),
          //   child: const Icon(Icons.app_settings_alt_sharp),
          //   ),
    );
  }



  