import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_customer.dart';

class ListCustomer extends StatefulWidget {
  ListCustomer({Key? key}) : super(key: key);

  @override
  State<ListCustomer> createState() => _ListCustomerState();
}

class _ListCustomerState extends State<ListCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 29, 201, 192),
                Color.fromARGB(255, 125, 221, 216)
              ], stops: [
                0.5,
                1.0
              ])),
            ),
            title: const Text(
              "Danh sách khách hàng",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelText: "Tìm kiếm",
                        labelStyle: TextStyle(fontSize: 18)),
                  )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCustomer()));
                      },
                      child: const Text(
                        'Thêm mới',
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {},
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: Card(
              color: Color.fromARGB(255, 218, 252, 219),
              child: ExpansionTile(
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Có 3 sản phẩm phù hợp"),
                    Text('Cuộc hẹn: 15h 12/12/2022',
                        style: const TextStyle(
                          color: Colors.red,
                        ))
                  ],
                ),
                textColor: Colors.black,
                title: Text(
                  "Anh Ngọc Anh",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("tìm nhà Lê Chân"),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("2.5 tỷ"),
                      Text("Lê chân"),
                      Text("50m"),
                      Text("hướng Đông"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.list_alt_rounded,
                            color: Colors.green,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                            size: 30,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
