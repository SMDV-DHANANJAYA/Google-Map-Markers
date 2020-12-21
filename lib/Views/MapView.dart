import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageView extends StatefulWidget {
  @override
  _MapPageViewState createState() => _MapPageViewState();
}

class Member{
  String id;
  String groupName;
  LatLng position;

  Member(this.id,this.groupName,this.position);
}

class _MapPageViewState extends State<MapPageView> {
  Completer<GoogleMapController> _controller = Completer();

  static List<Marker> _markerPlaces = [];
  bool _isOpenGroupPanel = false;

  bool allGroup = false;
  bool group1 = false;
  bool group2 = false;
  bool group3 = false;
  bool group4 = false;

  static final CameraPosition _initialPoint = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  List<Member> _groups = [
    Member('g1-1','Group 01', LatLng(37.43310002841134, -122.08622239530087)),
    Member('g1-2','Group 01', LatLng(37.435137197007414, -122.09327291697265)),
    Member('g1-3','Group 01', LatLng(37.43256383812343, -122.09511660039423)),
    Member('g1-4','Group 01', LatLng(37.434561353743156, -122.09008544683458)),
    Member('g1-5','Group 01', LatLng(37.43486458382751, -122.08613220602273)),
    Member('g2-1','Group 02', LatLng(37.429032979742416, -122.08350397646427)),
    Member('g2-2','Group 02', LatLng(37.42896162603906, -122.07811307162048)),
    Member('g2-3','Group 02', LatLng(37.426107155880906, -122.07636158913374)),
    Member('g2-4','Group 02', LatLng(37.424965177588206, -122.08080869168042)),
    Member('g2-5','Group 02', LatLng(37.423502866126434, -122.07606989890337)),
    Member('g3-1','Group 03', LatLng(37.42450241714458, -122.0940611511469)),
    Member('g3-2','Group 03', LatLng(37.42443105912316, -122.0910507068038)),
    Member('g3-3','Group 03', LatLng(37.423734782322406, -122.08768185228111)),
    Member('g3-4','Group 03', LatLng(37.420809017683254, -122.0874796807766)),
    Member('g3-5','Group 03', LatLng(37.420809017683254, -122.09192678332329)),
    Member('g4-1','Group 04', LatLng(37.41467274176376, -122.08390831947325)),
    Member('g4-2','Group 04', LatLng(37.41567241064826, -122.0804264768958)),
    Member('g4-3','Group 04', LatLng(37.41529773610057, -122.07694564014672)),
    Member('g4-4','Group 04', LatLng(37.413299706492516, -122.07896668463945)),
    Member('g4-5','Group 04', LatLng(37.41183610200435, -122.07636158913374)),
  ];

  void addMarker(String _markerID,String _infoWindow,LatLng _latLng,BitmapDescriptor _icon) async {
    _markerPlaces.add(Marker(
      markerId: MarkerId(_markerID),
      draggable: false,
      infoWindow: InfoWindow(title: _infoWindow),
      icon: _icon,
      position: _latLng,
      onTap: () {},
    ));
  }

  void setMarkers() async {
    _markerPlaces.clear();
    _groups.forEach((_member) {
      if(allGroup){
        switch(_member.groupName){
          case 'Group 01':
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
            break;
          case 'Group 02':
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
            break;
          case 'Group 03':
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
            break;
          case 'Group 04':
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
            break;
        }
      }
      else{
        if(group1){
          if(_member.groupName == 'Group 01'){
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
          }
        }
        if(group2){
          if(_member.groupName == 'Group 02'){
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
          }
        }
        if(group3){
          if(_member.groupName == 'Group 03'){
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
          }
        }
        if(group4){
          if(_member.groupName == 'Group 04'){
            addMarker(_member.id, _member.groupName.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialPoint,
            markers: Set.from(_markerPlaces),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (_){
              if(_isOpenGroupPanel){
                setState(() {
                  _isOpenGroupPanel = false;
                });
              }
            },
          ),
          Positioned(
            top: 50.0,
            right: 15.0,
            child: FloatingActionButton(
              heroTag: 'GroupBtn',
              mini: true,
              child: Icon(
                Icons.group,
                color: Colors.black87,
              ),
              backgroundColor: Colors.white,
              onPressed: () async {
                setState(() {
                  _isOpenGroupPanel = !_isOpenGroupPanel;
                });
              },
            ),
          ),
          Visibility(
            visible: _isOpenGroupPanel,
            child: Positioned(
              top: 50.0,
              right: 15.0,
              child: Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                width: 200.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Select Group'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: allGroup,
                                  onChanged: (value){
                                    setState(() {
                                      allGroup = !allGroup;
                                      group1 = false;
                                      group2 = false;
                                      group3 = false;
                                      group4 = false;
                                      setMarkers();
                                    });
                                  },
                                ),
                                Text('All Group'),
                              ],
                            ),
                            Visibility(
                              visible: !allGroup,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: group1,
                                    onChanged: (value){
                                      setState(() {
                                        group1 = !group1;
                                        setMarkers();
                                      });
                                    },
                                  ),
                                  Text('Group 01'),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !allGroup,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: group2,
                                    onChanged: (value){
                                      setState(() {
                                        group2 = !group2;
                                        setMarkers();
                                      });
                                    },
                                  ),
                                  Text('Group 02'),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !allGroup,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: group3,
                                    onChanged: (value){
                                      setState(() {
                                        group3 = !group3;
                                        setMarkers();
                                      });
                                    },
                                  ),
                                  Text('Group 03'),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !allGroup,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: group4,
                                    onChanged: (value){
                                      setState(() {
                                        group4 = !group4;
                                        setMarkers();
                                      });
                                    },
                                  ),
                                  Text('Group 04'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
