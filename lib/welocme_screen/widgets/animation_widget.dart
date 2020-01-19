import 'package:flutter/cupertino.dart';
import 'package:fluttie/fluttie.dart';

class animation_widget extends StatelessWidget {
  var height;

  animation_widget(var height) {
    this.height = height;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return animate(context, height);
  }

  static var emojiAnimation;

  void animation_img() async {
    var instance = Fluttie();
    var emojiComposition = await instance.loadAnimationFromAsset(
      "animations/welcome.json",
    );
    emojiAnimation = await instance.prepareAnimation(emojiComposition);
    emojiAnimation.start();
  }

  Widget animate(BuildContext context, var height) {
    animation_img();
    return FluttieAnimation(
      emojiAnimation,
      size: Size(MediaQuery.of(context).size.width * 3/4, height),
    );
  }
}
