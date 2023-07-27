import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BasicsPage(),
    );
  }
}

class Post {
  String text;
  String imageUrl;

  Post({required this.text, required this.imageUrl});
}

class CardItem {
  final String URLImage;
  final String name;

  const CardItem({
    required this.URLImage,
    required this.name
  });
}

class BasicsPage extends StatelessWidget {
  List<CardItem> items = [
    CardItem(
      URLImage: "https://www.pexels.com/photo/woman-in-collared-shirt-774909/", 
      name: "christy"
    ),
     CardItem(
      URLImage: "https://www.pexels.com/photo/woman-in-collared-shirt-774909/", 
      name: "christy"
    ),
     CardItem(
      URLImage: "https://www.pexels.com/photo/woman-in-collared-shirt-774909/", 
      name: "christy"
    )
  ];

  final List<Post> posts = [
    Post(
      text: '',
      imageUrl:
          'https://images.pexels.com/photos/865002/pexels-photo-865002.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Post(
      text: 'at Work',
      imageUrl:
          'https://images.pexels.com/photos/3861959/pexels-photo-3861959.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    // Add more posts here...
  ];

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Profile"),
        leading: Icon(Icons.favorite),
        actions: [Icon(Icons.handyman),
        Icon(Icons.border_color)],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                color: Colors.black,
                child: Expanded(
                  child:Image.asset("images/image2.jpg", fit: BoxFit.cover,)), 
              ),
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 73, 
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 73,
                        backgroundImage: AssetImage("images/testimage.jpg"),
                      ), 
                    ),
                    Text(
                      "Otman Malki",
                      style: TextStyle(
                        fontSize: size.width/15,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              )
            ],
          ),
          Text(
            "Otman malki is a student",
            textAlign: TextAlign.left,
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text('Modify Profile'),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
              onPressed: (){
              }, 
              icon: Icon(Icons.border_color),
              ),)
          ],),
          Divider(
            height: 20,
            thickness: 1,
            color: Colors.grey[300],
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(
                      fontSize: size.width/15,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    IconWithDescription(
                      icon: Icons.home,
                      description: 'Hay Riyad, Rabat-Sale-Kenitra',
                    ),
                    IconWithDescription(
                      icon: Icons.work,
                      description: 'flutter developper',
                    ),
                    IconWithDescription(
                      icon: Icons.favorite,
                      description: 'Celibataire',
                    ),
                  ],

            )
        )]),
        Divider(
          height: 20,
          thickness: 1,
          color: Colors.grey[300],
          indent: 20,
          endIndent: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Friends",
              style: TextStyle(
              fontSize: size.width/15,
              fontWeight: FontWeight.bold
              ),
            ),
            Container(
              height: 256,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (Context, _) => SizedBox(width: 12),
                itemBuilder: (Context, index) => buildCard(item: items[index]),
              )
            )
          ],  
        )
    ])));
  }

  Widget buildCard({required CardItem item,}) => Container(
    width: 200,
    color: Colors.red,
    child: Column(
      children: [
        Expanded(
          child: Image.network(
            item.URLImage,
            fit: BoxFit.cover,
            )
        ),
        SizedBox(height: 4),
        Text(
          item.name,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );

  CircleAvatar MyProfile(){
    return CircleAvatar(
      radius: 58,
      backgroundImage: AssetImage("images/testimage.jpg"),
    );
  }


  Text textRich(String a, String b, String c){
    return Text.rich(
          TextSpan(
            text: 'text', 
            style: TextStyle(color: Colors.blueAccent),
            children: [
            TextSpan(
              text: 'text',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            TextSpan(
              text: 'text',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ]
          )
        );
  }

  Text SimpleText(String text){
    return Text(
        text,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ));
  }
}

class IconWithDescription extends StatelessWidget {
  final IconData icon;
  final String description;

  IconWithDescription({required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          description,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

