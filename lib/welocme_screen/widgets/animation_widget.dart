import 'package:flutter/cupertino.dart';
import 'package:fluttie/fluttie.dart';

class animation_widget extends StatelessWidget {
  var height,width;
  var animate_link;

  animation_widget(var height,var animate_link,var width) {
    this.height = height;
    this.animate_link = animate_link;
    this.width = width;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return animate(context, height, width);
  }

  static var emojiAnimation;

  void animation_img() async {
    var instance = Fluttie();
    var emojiComposition = await instance.loadAnimationFromAsset(
      animate_link,
    );
    emojiAnimation = await instance.prepareAnimation(emojiComposition);
    emojiAnimation.start();
  }

  Widget animate(BuildContext context, var height ,var width) {
    animation_img();
    return FluttieAnimation(
      emojiAnimation,
      size: Size(width , height),
    );
  }
}
