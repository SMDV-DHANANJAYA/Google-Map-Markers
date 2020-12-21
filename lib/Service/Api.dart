/*
import 'package:bank_app/Model/Member.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Api{
  static List<Marker> markerPlaces = [];

  List<Member> group1 = [
    Member('1','Group 01', LatLng(37.43716525880886, -122.09453254938124)),
    Member('2','Group 01', LatLng(37.436327738241694, -122.08920903503895)),
    Member('3','Group 01', LatLng(37.43256383812343, -122.09511660039423)),
    Member('4','Group 01', LatLng(37.434561353743156, -122.09008544683458)),
    Member('5','Group 01', LatLng(37.43486458382751, -122.08613220602273)),
  ];

  List<Member> group2 = [
    Member('1','Group 02', LatLng(37.429032979742416, -122.08350397646427)),
    Member('2','Group 02', LatLng(37.42896162603906, -122.07811307162048)),
    Member('3','Group 02', LatLng(37.426107155880906, -122.07636158913374)),
    Member('4','Group 02', LatLng(37.424965177588206, -122.08080869168042)),
    Member('5','Group 02', LatLng(37.423502866126434, -122.07606989890337)),
  ];

  List<Member> group3 = [
    Member('1','Group 03', LatLng(37.42450241714458, -122.0940611511469)),
    Member('2','Group 03', LatLng(37.42443105912316, -122.0910507068038)),
    Member('3','Group 03', LatLng(37.423734782322406, -122.08768185228111)),
    Member('4','Group 03', LatLng(37.420809017683254, -122.0874796807766)),
    Member('5','Group 03', LatLng(37.420809017683254, -122.09192678332329)),
  ];

  List<Member> group4 = [
    Member('1','Group 04', LatLng(37.41467274176376, -122.08390831947325)),
    Member('2','Group 04', LatLng(37.41567241064826, -122.0804264768958)),
    Member('3','Group 04', LatLng(37.41529773610057, -122.07694564014672)),
    Member('4','Group 04', LatLng(37.413299706492516, -122.07896668463945)),
    Member('5','Group 04', LatLng(37.41183610200435, -122.07636158913374)),
  ];

  void addMarker(String _markerID,String _infoWindow,LatLng _latLng,BitmapDescriptor _icon) async {
    markerPlaces.add(Marker(
      markerId: MarkerId(_markerID),
      draggable: false,
      infoWindow: InfoWindow(title: _infoWindow),
      icon: _icon,
      position: _latLng,
      onTap: () {},
    ));
  }

  void setMarkers(String _group) async {
    switch(_group){
      case 'Group 01':
        print(_group);
        group1.forEach((_member) {
          addMarker(_member.id, _member.name.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
        });
        break;
      case 'Group 02':
        group2.forEach((_member) {
          addMarker(_member.id, _member.name.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
        });
        break;
      case 'Group 03':
        group3.forEach((_member) {
          addMarker(_member.id, _member.name.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow));
        });
        break;
      case 'Group 04':
        group4.forEach((_member) {
          addMarker(_member.id, _member.name.toUpperCase(), _member.position,BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
        });
        break;
    }
  }

}*/
