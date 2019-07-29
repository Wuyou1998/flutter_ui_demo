import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RadialExpansionDemo();
  }
}

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  Photo({this.photo, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).accentColor.withOpacity(0.25),
      child: InkWell(
          onTap: onTap,
          child: LayoutBuilder(builder: (context, size) {
            return Image.network(
              photo,
              fit: BoxFit.contain,
              width: width,
            );
          })),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final clipRectSize;
  final Widget child;

  RadialExpansion({this.maxRadius, this.child})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: kMaxRadius * 2,
                height: kMaxRadius * 2,
                child: Hero(
                    createRectTween: _createRectTween,
                    tag: imageName,
                    child: RadialExpansion(
                      maxRadius: kMaxRadius,
                      child: Photo(
                        photo: imageName,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
          createRectTween: _createRectTween,
          tag: imageName,
          child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: Photo(
              photo: imageName,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                  return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      });
                }));
              },
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimationPage2'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(
                context,
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560675990942&di=513380555abde07bf286b5814b710e26&imgtype=0&src=http%3A%2F%2Fimages.liqucn.com%2Fh027%2Fh13%2Fimages201508311321540_info200X200.png',
                '第一个'),
            _buildHero(
                context,
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560675990941&di=9a82595b0b2172ff63f13bed671f1bab&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F00%2F25%2F87%2F8856d0846be0a5e.jpg',
                '第二个'),
            _buildHero(
                context,
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560675990941&di=03e134760d0e981023d1a0ab47e9b4c2&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F01%2F54%2F66%2F11574729a5dffcc.jpg',
                '第三个'),
          ],
        ),
      ),
    );
  }
}
