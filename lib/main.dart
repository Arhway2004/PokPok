import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Model menu = menu();
  // Model date = date();
  // Model member = member();
  // last list<Member> member;
  final List<Map<String, dynamic>> orders = [
    {
      "name": "นาย",
      "amount": "23,400",
      "imageUrl": "Style/img.png",
      "phone": "099999999"
    },
    {
      "name": "บอล",
      "amount": "15,900",
      "imageUrl": "Style/img.png",
      "phone": "099999999"
    },
    {
      "name": "โอ๊ค",
      "amount": "13,750",
      "imageUrl": "Style/img.png",
      "phone": "099999999"
    },
    {
      "name": "นาตาลี",
      "amount": "9,500",
      "imageUrl": "Style/img.png",
      "phone": "099999999"
    },
    {
      "name": "ฮาร์ท",
      "amount": "8,100",
      "imageUrl": "Style/img.png",
      "phone": "099999999"
    },
    // Add more items...
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  //   members=[
  //     Member(
  //       name: 'นาย',
  //       phoneNumber:'099999999',
  //       price:'23,400',
  //       imageUrl'Style/img.png',
  //     ),
  //     Member(
  //       name: 'บอล',
  //       phoneNumber:'099999999',
  //       price:'15,900',
  //       imageUrl'Style/img.png',
  //     ),
  //     Member(
  //       name: 'โอ๊ค',
  //       phoneNumber:'099999999',
  //       price:'13,750',
  //       imageUrl'Style/img.png',
  //     ),
  //     Member(
  //       name: 'นาตาลี',
  //       phoneNumber:'099999999',
  //       price:'9,500',
  //       imageUrl'Style/img.png',
  //     ),
  //     Member(
  //       name: 'ฮาร์ท',
  //       phoneNumber:'099999999',
  //       price:'8,100',
  //       imageUrl'Style/img.png',
  //     ),
  //
  //   ]
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข้าวขาหมูตรองซุง',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Add action for menu button if needed
          },
          icon: Icon(
            Icons.menu,
            color: Color(0xFFC9824A),
          ),
        ),
        backgroundColor: Color(0xFFF1E4D0),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: Color(0xFFCBCDCA),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '20 กุมภา',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  child: SizedBox(
                    height: 120,
                    child: Container(
                      padding: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            // Update the path to your image asset
                            backgroundImage: AssetImage(
                              orders[index]['imageUrl'] ?? 'Style/image.png',
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // This will space out the children across the Row
                          children: [
                            Text(
                              orders[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30 // Correct placement inside TextStyle
                                  ),
                            ),
                            Text(
                              orders[index]['price'],
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20 // Optionally setting a fontSize for the price for consistent styling
                                  ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.play_arrow,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          // Navigate to the detail page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage()),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Color(0xFFF1E4D0),
      ),
      body: Container(
        width: double.infinity,
        height: 40,
        color: Color(0xFFCBCDCA),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '20 กุมภา',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Text(
                '30',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
