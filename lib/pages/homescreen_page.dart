import 'package:api_test/models/users.dart';
import 'package:api_test/services/user_api.dart';
import 'package:flutter/material.dart';

class HomescreenPage extends StatefulWidget {
  const HomescreenPage({super.key});

  @override
  State<HomescreenPage> createState() => _HomescreenPageState();
}

class _HomescreenPageState extends State<HomescreenPage> {
  List<Users> users = [];
  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  // void fetchUsers() async {
  //   const url = 'https://randomuser.me/api/?results=10';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map((e) {
  //     return Users(email: e["email"], firstName: e["name"]["first"]);
  //   }).toList();
  //   setState(() {
  //     users = transformed;
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          // child: Column(
          //   children: [
          //     DrawerHeader(
          //       child: Icon(
          //         Icons.android,
          //         size: 100,
          //       ),
          //     )
          //   ],
          // ),
          ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("API test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final firstName = user.firstName;
            final email = user.email;
            final dob = user.dob;
            // final imageUrl = user['picture']['medium'];
            // final image = Image.network(imageUrl);
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                      // leading: ClipRRect(
                      //   child: image,
                      //   borderRadius: BorderRadius.circular(100),
                      // ),
                      title: Text(
                        firstName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Wrap(
                        children: [
                          Text(
                            email,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            dob.age.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "Date of Birth: " + dob.date.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }
}
