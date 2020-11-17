import 'package:crud_example/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const _baseUrl = 'https://crud-example-a36b4.firebaseio.com/';
Future<void> get(User user) async {
  final response = await http.get("$_baseUrl/users.json");
  final id = json.decode(response.body)['name'];
  var DUMMY_USERS = {
    id.get = () => User(
        id: id, name: user.name, email: user.email, avatarUrl: user.avatarUrl)
  };
}

/*
var DUMMY_USERS = {
  '1': User(
      id: '1',
      name: 'Maria',
      email: 'maria@live.com',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/08/20/05/36/avatar-1606914_960_720.png'),
  '2': User(
      id: '2',
      name: 'fred',
      email: 'freedy.rick@gmail.com',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2019/11/05/20/02/man-4604423_960_720.png'),
  '3': User(
      id: '3',
      name: 'Joao',
      email: 'Joao@governo.go.gov.br',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/09/01/08/25/smiley-1635465_960_720.png')
};
*/
/*
Future<String> getJSONData() async {
  var response = await http.get('https://crud-example-a36b4.firebaseio.com/');
  var data = json.decode(response.body)['name'];
     id,
      () => User(
        id: id, 
        name: user.name, email: 
        user.email, avatarUrl: user.avatarUrl)
        ;
  return "dados obtidos";
}
*/

/*

/*import 'package:crud_example/models/user.dart';
import 'dart:convert';
import 'package:crud_example/models/user.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String _baseUrl = 'https://crud-example-a36b4.firebaseio.com/';
  Future<List<User>> getPosts() async {
    http.Response res = await http.get(_baseUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<User> _items = body.map((dynamic item) => User.fromJson(item));
      return _items;
    } else {
      throw "Can´t get posts";
    }
  }
}

const DUMMY_USERS = {json.decode(res.body)['name'];};
  List data;

  Future<void> get(User user) async {
    //toda vez que usa async, retorna uma future
    if (user != null) {
      return;
    }
  Future<String> getJSONData() async {
    var response = await http.get(_baseUrl);
    data = json.decode(response.body)['name'];
      print(json.decode(response.body));
      _items.putIfAbsent(
        id,
        () => User(
            id: id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl),
      );
    return "dados obtidos";
  }

*/
*/
