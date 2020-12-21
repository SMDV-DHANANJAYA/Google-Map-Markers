/*
import 'package:bank_app/Service/Api.dart';
import 'package:flutter/material.dart';

class ChipItem extends StatefulWidget {

  final String _type;
  final IconData _icon;

  const ChipItem(this._type,this._icon);

  @override
  _ChipItemState createState() => _ChipItemState();
}

class _ChipItemState extends State<ChipItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          Api api = new Api();
          api.setMarkers(widget._type);
        });
      },
      child: Chip(
        backgroundColor: Colors.white,
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            widget._icon,
            color: Colors.black87,
          ),
        ),
        label: Text(widget._type),
      ),
    );
  }
}
*/
