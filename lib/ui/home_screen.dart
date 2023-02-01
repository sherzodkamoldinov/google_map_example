import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_example/ui/widgets/drop_down_button.dart';
import 'package:google_map_example/ui/widgets/map_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  bool isActive = false;
  double lat = 0;
  double long = 0;

  late GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = GoogleMapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Google Map", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)), boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                )
              ]),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(isExpanded ? 0 : 30)),
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(41, 61),
                      ),
                      onCameraIdle: () {
                        isActive = false;
                        setState(() {});
                      },
                      onCameraMoveStarted: () {
                        isActive = true;
                        setState(() {});
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      scale: isActive ? 1.3 : 1,
                      child: Image.asset(
                        'assets/placeholder.png',
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),

                  // MAP BUTTONS
                  // ZOOM BUTTONS
                  Positioned(
                    right: 15,
                    bottom: 115,
                    child: MapButton(
                      onTap: () {},
                      icon: Icons.add,
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 65,
                    child: MapButton(
                      onTap: () {},
                      icon: Icons.remove,
                    ),
                  ),

                  // EXPANDED BUTTON
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: MapButton(
                      onTap: () {
                        isExpanded = !isExpanded;
                        print(isExpanded);
                        setState(() {});
                      },
                      icon: CupertinoIcons.resize,
                    ),
                  ),

                  // GET MY LOCATION
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: MapButton(
                      onTap: () {},
                      icon: Icons.location_on_rounded,
                    ),
                  ),

                  // ADD MARKER
                  Positioned(
                    left: 15,
                    top: 15,
                    right: 15,
                    child: Row(
                      children: [
                        CustomDropDownButton(
                          item: (value) {},
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text('Toshkent, Sergeli 5',textAlign: TextAlign.center,overflow: TextOverflow.visible),
                          ),
                        )
                      ],
                    ),
                  ),
                
                  
                ],
              ),
            ),
          ),
          if (!isExpanded) const SizedBox(height: 20),
          Visibility(
            visible: !isExpanded,
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(alignment: Alignment.center, child: SizedBox(width: 50, child: Divider(thickness: 2))),
                  const SizedBox(height: 10),
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Location Info',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: 'Lat: ', style: TextStyle(color: Colors.black)),
                    TextSpan(text: lat.toStringAsFixed(3), style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: 'Long: ', style: TextStyle(color: Colors.black)),
                    TextSpan(text: long.toStringAsFixed(3), style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black))
                  ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
