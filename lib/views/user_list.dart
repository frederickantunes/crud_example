//import 'package:crud_example/models/user.dart';
import 'package:crud_example/provider/user-provider.dart';
import 'package:crud_example/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:crud_example/components/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de usuários:',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
// o metodo push chama a tela sem fechar a que está aberta, isso faz com q
// o app fixa uma seta para voltar para a tela anterior.              
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}

//arquivo para o corpo do app
/*resumindo, é declarado no widget builder o buildt context contex que recebe
os usuarios do dommy user, e aqui nessa tela é feito o users.lenght que 
pega o numero de cadastros no user e no item builder ele recebe o contexto 
e o indice pela funcao usertile()... na funcao é passado pelo elementAti
o registro que ta naquele indicite e tratado no listview e retornado na tela
*/
