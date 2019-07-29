import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageExhibitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片展示组件'),
      ),
      body: new ImageWidget(),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
            child: CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl:
                    'https://www.mntup.com/uploadfile/201906/10/5D212145244.jpg')),
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.assetNetwork(
              placeholder: 'images/image01.jpeg',
              image:
                  'https://www.mntup.com/uploadfile/201906/10/F0212145228.jpg'),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://www.mntup.com/uploadfile/201906/8/60214323244.jpg'),
        ),
        Image.network(
            "https://www.mntup.com/uploadfile/201906/8/5E214323740.jpg"),
        Image.asset('images/image01.jpeg'),
        Image.file(File('sdcard/DCIM/Camera/outPutImage1.jpg')),
        Icon(Icons.android,color: Colors.greenAccent,size: 80,),
        Icon(IconData(0xf6685))
      ],
    );
  }

//  Future<File> getPath() async {
//    Directory tempDir = await getTemporaryDirectory();
//    String tempPath = tempDir.path;
//    return File(tempPath);
//  }
}
