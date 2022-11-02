import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data.dart';
import 'package:flutter_application_1/widgets/common_constant.dart';
import 'package:flutter_application_1/widgets/common_function.dart';
import 'package:flutter_application_1/widgets/common_widgets.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final TextEditingController tenkhachController = TextEditingController();
  final TextEditingController lienlacController = TextEditingController();
  final TextEditingController taichinhController = TextEditingController();
  final TextEditingController dientichController = TextEditingController();
  final TextEditingController phantramController = TextEditingController();

  final ListData listData = ListData();

  String khuvuc = "Lê Chân";
  String huong = "Đông";
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tenkhachController.dispose();
    lienlacController.dispose();
    taichinhController.dispose();
    dientichController.dispose();
    phantramController.dispose();
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void addData() async {
    Property newproperty = (Property(
        "label",
        tenkhachController.text,
        taichinhController.text,
        "location",
        dientichController.text,
        phantramController.text,
        "description",
        "frontImage",
        "ownerImage", []));
    setState(() {
      listData.listProperty.add(newproperty);
    });
  }

  List<String> listQuanHuyen = [
    "Lê Chân",
    "Ngô Nguyền",
    "Hải An",
    "Kiến An",
    "Dương Kinh",
    "Đồ Sơn",
    "An Lão",
    "Thủy Nguyên",
    "Tiên Lãng",
    "Vĩnh Bảo",
    "Kiến Thụy",
    "An Dương",
    "Cát Hải, Bạch Long Vĩ"
  ];
  List<String> listHuongNha = [
    "Đông",
    "Tây",
    "Nam",
    "Bắc",
    "Đông-Bắc",
    "Tây-Nam",
    "Tây-Bắc",
    "Đông-Nam"
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              "Thêm khách hàng",
              style: TextStyle(),
            ),
            centerTitle: true,
          )),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomTextField(
                    controller: tenkhachController,
                    hintText: 'Tên khách hàng',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: lienlacController,
                    hintText: 'Liên lạc',
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: dientichController,
                    hintText: 'Diện tích',
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: taichinhController,
                    hintText: 'Tài chính',
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Khu vực:  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: DropdownButton(
                            value: khuvuc,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listQuanHuyen.map((String item) {
                              return DropdownMenuItem(
                                  value: item, child: Text(item));
                            }).toList(),
                            onChanged: (String? newVal) {
                              setState(() {
                                khuvuc = newVal!;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Hướng:  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: DropdownButton(
                            value: huong,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listHuongNha.map((String item) {
                              return DropdownMenuItem(
                                  value: item, child: Text(item));
                            }).toList(),
                            onChanged: (String? newVal) {
                              setState(() {
                                huong = newVal!;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      text: 'THÊM',
                      onTap: () {
                        //addData();
                        print(listData.listProperty.isNotEmpty);
                        print(listData.listProperty[2].name);
                      })
                ],
              ),
            )),
      ),
    );
  }
}
