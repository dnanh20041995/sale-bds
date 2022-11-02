import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data.dart';
import 'package:flutter_application_1/widgets/common_constant.dart';
import 'package:flutter_application_1/widgets/common_function.dart';
import 'package:flutter_application_1/widgets/common_widgets.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController diachiController = TextEditingController();
  final TextEditingController lienlacController = TextEditingController();
  final TextEditingController priceContrller = TextEditingController();
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
    diachiController.dispose();
    lienlacController.dispose();
    priceContrller.dispose();
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
        diachiController.text,
        priceContrller.text,
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
              "Thêm sản phẩm",
              style: TextStyle(),
            ),
            centerTitle: true,
          )),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images
                              .map((i) =>
                                  Builder(builder: (BuildContext context) {
                                    return Image.file(
                                      i,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    );
                                  }))
                              .toList(),
                          options:
                              CarouselOptions(viewportFraction: 1, height: 200),
                        )
                      : InkWell(
                          onTap: () {
                            selectImages();
                          },
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Thêm ảnh",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade400),
                                    )
                                  ],
                                ),
                              )),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: diachiController,
                    hintText: 'Địa chỉ',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: lienlacController,
                    hintText: 'Liên lạc',
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
                    controller: priceContrller,
                    hintText: 'Giá',
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
                  CustomTextField(
                    controller: phantramController,
                    hintText: 'Phần trăm',
                    inputType: TextInputType.number,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      text: 'Thêm sản phẩm',
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
