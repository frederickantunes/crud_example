import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crud_example/data/dummy_users.dart';
import 'package:crud_example/models/user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  static const _baseUrl = 'https://crud-example-a36b4.firebaseio.com/';

  Map userMap = jsonDecode("$_baseUrl/users.json");
  var _items = User.fromJson(userMap);

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  // meu metodo put tanto inclui como altera um elemento
  Future<void> put(User user) async {
    //toda vez que usa async, retorna uma future
    if (user == null) {
      return;
    }

    //o itemcointainskey verifica se háo parametro chamado
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      final response = await http.patch(
        "$_baseUrl/users/${user.id}.json",
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );
      _items.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      //adicionar
      final response = await http.post(
        "$_baseUrl/users.json",
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );

      final id = json.decode(response.body)['name'];
      print(json.decode(response.body));
      _items.putIfAbsent(
        id,
        () => User(
            id: id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      http.delete("$_baseUrl/users/${user.id}.json");
      _items.remove(user.id);
      notifyListeners();
    }
  }
}

/*

essa arquivo ira controlar a lista de usuarios, tanto para adicionar, editar
e excluir, tudo a partir do indice
notifylisteners, implementado um padrao oberver, o change notifier.
semrpe quando tiver uma mudança a interface gráfica será atualizada


Foi instalado nas depencias do yaml o provider:
*dependencies:
  flutter:
    sdk: flutter
  provider:  
*/
