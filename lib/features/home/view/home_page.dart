import 'package:flutter/cupertino.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CommonAppBar(
        title: 'Главная',
      ),
      child: Center(

      )
    );
  }
}