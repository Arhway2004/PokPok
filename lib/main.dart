import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final List<Map<String, dynamic>> orders = [
    {
      "name": "นาย",
      "amount": "23,400",
      "imageUrl": "Style/img.png",
      "phone": "099999999",
      "status": "รอยืนยันออเดอร์"
    },
    {
      "name": "บอล",
      "amount": "15,900",
      "imageUrl": "Style/img.png",
      "phone": "099999999",
      "status": "รอยืนยันออเดอร์"
    },
    {
      "name": "โอ๊ค",
      "amount": "13,750",
      "imageUrl": "Style/img.png",
      "phone": "099999999",
      "status": "รอยืนยันออเดอร์"
    },
    {
      "name": "นาตาลี",
      "amount": "9,500",
      "imageUrl": "Style/img.png",
      "phone": "099999999",
      "status": "รอยืนยันออเดอร์"
    },
    {
      "name": "ฮาร์ท",
      "amount": "8,100",
      "imageUrl": "Style/img.png",
      "phone": "099999999",
      "status": "รอยืนยันออเดอร์"
    },
  ];
  String orderStatus = 'รอยืนยันออเดอร์';

  Future<void> changeOrderStatus(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(
        name: orders[index]['name'],
        amount: orders[index]['amount'],
      )),
    );

    if (result != null) {
      setState(() {
        orders[index]['status'] = result;
      });
    }
  }


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
            height: 60,
            color: Color(0xFFCBCDCA),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '20 กุมภา',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
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
                    height: 150,
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
                            backgroundImage: AssetImage(
                              orders[index]['imageUrl'],
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orders[index]['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25
                              ),
                            ),
                            Text(
                              orders[index]['amount'],
                              style: TextStyle(
                                  color: Color(0xFFD57D2C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orders[index]['status']?? 'รอยืนยันออเดอร์',
                              style: TextStyle(
                                fontSize: 20,
                                color: orders[index]['status'] == 'ยกเลิก' ? Colors.red
                                    : orders[index]['status'] == 'รับออเดอร์' ? Colors.green
                                    : Colors.grey,
                              ),
                            ),

                            InkWell(
                              onTap: () async{
                                const imageUrl1 = 'Style/img_2.png';
                                var url = 'tel:${orders[index]['phone']}';
                                if (await canLaunch(orders[index]['phone'])) {
                                  await launch(orders[index]['phone']);
                                }else{
                                  print('Could not launch $imageUrl1');
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('Style/img_2.png'),
                                radius: 20,
                              ),
                            )
                          ],
                        ),
                        trailing: Icon(
                          Icons.play_arrow,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          changeOrderStatus(index);
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
  final String name;
  final String amount;

  DetailPage({required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Color(0xFFF1E4D0),
        actions: [
          IconButton(
            onPressed: () async {
              const imageUrl1 = 'Style/img_2.png';
              if (await canLaunch(imageUrl1)) {
                await launch(imageUrl1);
              } else {
                print('Could not launch $imageUrl1');
              }
            },
            icon: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('Style/img_2.png'),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            color: Color(0xFFCBCDCA),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '20 กุมภา',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    amount + "-",
                    style: TextStyle(
                      color: Color(0xFFD57D2C),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Image.asset(
              'Style/img_3.png',
              height: 500,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'ยกเลิก'),
                      child: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Button color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Border radius
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Spacing between buttons
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'รับออเดอร์'),
                      child: Text(
                        'รับออเดอร์',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Button color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
