import 'package:crud_example/routes/app_routes.dart';
import 'package:crud_example/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:crud_example/provider/user-provider.dart';
import 'package:crud_example/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Users(),
            //create recebe uma funnção changenotifier donomidada user no provider
            // na aula o cara ensina usar um create no lugar do builder
            // nao sei se é problema de versão do flutter, mas até o o momento
            // o codigo está funcionando
            //o erro era o provider que estava desatualiazado no pub.yaml
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm()
          },
        ));
  }
}

//até entao ta usando somente o user_list
//MultiProvider é utilizado para utilizar mais de um provider
