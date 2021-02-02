import 'package:app_social_api/models/comment_model.dart';
import 'package:app_social_api/models/post_model.dart';
import 'package:app_social_api/models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceholderService {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPost() async {
    var response = await http.get('$baseUrl/posts');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var post = objs.map((obj) => Post.fromJson(obj)).toList();
      return post;
    } else {
      throw Exception('Erro ao buscar post, Cod: ${response.statusCode}');
    }
  }

  Future<User> getPerfil() async {
    var response = await http.get('$baseUrl/users/1');
    if (response.statusCode == 200) {
      var user = User.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw Exception('Erro ao buscar Perfil, Cod: ${response.statusCode}');
    }
  }

  Future<List<Comment>> getComments(int postId) async {
    var response = await http.get('$baseUrl/posts/$postId/comments');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var comments = objs.map((obj) => Comment.fromJson(obj)).toList();
      return comments;
    } else {
      throw Exception('Erro ao buscar post, Cod: ${response.statusCode}');
    }
  }
}
