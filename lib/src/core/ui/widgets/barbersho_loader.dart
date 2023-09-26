import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BarbershoLoader extends StatelessWidget {

  const BarbershoLoader({ super.key });

   @override
   Widget build(BuildContext context) {
       return Center(
        child: LoadingAnimationWidget.discreteCircle(color: Colors.brown, size: 60),
       );
  }
}