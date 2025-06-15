import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';

class CustomContainerHome extends StatelessWidget {
  String? image;
  String? titleNews;
  String? logoChannel;
  String? channelName;
  String? newsTime;
  CustomContainerHome({
    super.key,
    required this.image,
    required this.titleNews,
    required this.logoChannel,
    required this.channelName,
    required this.newsTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("${image}"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(64, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("${titleNews}", style: TextStyle(color: Colors.white)),
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                child: Image.asset("${logoChannel}"),
                backgroundColor: Colors.white,
              ),
              Text("${channelName}", style: TextStyle(color: Colors.white)),
              Spacer(),
              Text("${newsTime}", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
