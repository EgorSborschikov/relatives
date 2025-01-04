import 'package:flutter/cupertino.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';

class AddContactsPage extends StatelessWidget{
  const AddContactsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CommonAppBar(
        title: 'Добавить контакт',
      ),
      child: Center(

      )
    );
  }
}