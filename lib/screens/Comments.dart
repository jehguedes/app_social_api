import 'package:app_social_api/models/comment_model.dart';
import 'package:app_social_api/service/placeholder_service.dart';
import 'package:app_social_api/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final _placeholderService = PlaceholderService();
  final int postId;

  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white24,
        child: FutureBuilder<List<Comment>>(
          future: _placeholderService.getComments(postId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('${snapshot.data[index].name}'),
                          subtitle: Text('${snapshot.data[index].email}'),
                        ),
                        ListTile(
                          title: Text('${snapshot.data[index].name}'),
                          subtitle: Text('${snapshot.data[index].body}'),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
