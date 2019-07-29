import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画'),
      ),
      body: PhotoHero(
        photo:
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560622883984&di=4eb64bf13a2495f357d4edb8c90e590c&imgtype=0&src=http%3A%2F%2Fimage.tupian114.com%2F20140424%2F14515181.png.thumb.jpg',
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HeroAnimation()));
        },
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  PhotoHero({this.photo, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onTap,
                child: LayoutBuilder(builder: (context, size) {
                  return Image.network(
                    photo,
                    fit: BoxFit.contain,
                    width: width,
                  );
                })),
          )),
    );
  }
}



class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimation2'),
      ),
      body: Center(
        child: PhotoHero(
          photo:
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560622883984&di=4eb64bf13a2495f357d4edb8c90e590c&imgtype=0&src=http%3A%2F%2Fimage.tupian114.com%2F20140424%2F14515181.png.thumb.jpg',
          width: 100,
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HeroAnimationPage()));
          },
        ),
      ),
    );
  }
}



