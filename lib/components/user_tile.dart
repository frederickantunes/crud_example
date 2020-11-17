import 'package:crud_example/provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:crud_example/models/user.dart';
import 'package:crud_example/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);
                },
                color: Colors.orange,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Excluir usuário'),
                            content: Text('Tem certeza?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Não'),
                                onPressed:() => Navigator.of(context).pop(false),
                              ),
                              FlatButton(
                                child: Text('Sim'),
                                  onPressed:()=> Navigator.of(context).pop(true)
                              ) 
                            ],
                          ),
                        ).then((confirmed){
                           if(confirmed){
                            Provider.of<Users>
                            (context, listen: false).remove(user);
                           } 
                        } 
                      );
                },
              )
            ],
          )),
    );
  }
}
// arquivo que chama os componentes da tela
