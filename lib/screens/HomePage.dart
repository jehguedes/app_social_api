import 'package:app_social_api/models/post_model.dart';
import 'package:app_social_api/screens/Comments.dart';
import 'package:app_social_api/service/placeholder_service.dart';
import 'package:app_social_api/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _placeholderService = PlaceholderService();
/*   List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _placeholderService.getPost().then((resp) {
      setState(() {
        _posts = resp;
      });
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white30,
        child: FutureBuilder<List>(
          future: _placeholderService.getPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Comments(snapshot.data[index].id),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              title: Text(
                                '${snapshot.data[index].title}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                '${snapshot.data[index].body}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

/*

*/
