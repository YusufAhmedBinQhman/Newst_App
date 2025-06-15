import 'package:flutter/material.dart';

class TopNewsWidget extends StatelessWidget {
  String? imageNews;
  String? titleNews;
  String? logoChannel;
  String? channelName;
  String? newsTime;
  TopNewsWidget({
    super.key,
    required this.imageNews,
    required this.titleNews,
    required this.logoChannel,
    required this.channelName,
    required this.newsTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 5),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),

        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(64, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image news
          Container(
            width: 150,
            height: 100,
            // margin: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10),

              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(64, 0, 0, 0),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageNews ??
                    "https://asset.dr.dk/drdk/freja-images/317?im=AspectCrop%3D%28700%2C394%29%2CxPosition%3D.5%2CyPosition%3D.5%3BResize%3D%28700%2C394%29",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              SizedBox(
                // height: ,
                width: 220,
                child: Text(
                  "${titleNews}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ////logo& nameNews
              Container(
                // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 3,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset("${logoChannel}"),
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      width: 90,
                      child: Text(
                        "${channelName}",
                        // textAlign: TextAlign.,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        maxLines: 2, // السماح فقط بسطرين
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 80,
                      // color: Colors.amber,
                      child: Text(
                        "${newsTime}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        maxLines: 2, // السماح فقط بسطرين
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
