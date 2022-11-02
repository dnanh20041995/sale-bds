import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues selectedPriceRange = const RangeValues(400, 1000);
  RangeValues selectedSqrRange = const RangeValues(400, 1000);
  bool _Click = false;
  final otoCheck = CheckBoxModal(title: "Ô tô đỗ cửa");
  String chooseQuanHuyen = "Lê Chân";
  String chooseHuongNha = "Đông";
  List listQuanHuyen = [
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
  List listHuongNha = [
    "Đông",
    "Tây",
    "Nam",
    "Bắc",
    "Đông-Bắc",
    "Tây-Nam",
    "Tây-Bắc",
    "Đông-Nam"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 24, left: 24, top: 32, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Tiêu chí",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "bạn tìm kiếm",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Text(
                "Khoảng",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Giá",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          RangeSlider(
            values: selectedPriceRange,
            divisions: 16,
            labels: RangeLabels(selectedPriceRange.start.toString(),
                selectedPriceRange.end.toString()),
            onChanged: (RangeValues newRange) {
              setState(() {
                selectedPriceRange = newRange;
              });
            },
            min: 50,
            max: 3000,
            activeColor: Colors.blue[900],
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"50 triệu",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                r"30 tỷ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Text(
                "Diện tích",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          RangeSlider(
            values: selectedSqrRange,
            divisions: 16,
            labels: RangeLabels(selectedSqrRange.start.toString(),
                selectedSqrRange.end.toString()),
            onChanged: (RangeValues newRange) {
              setState(() {
                selectedSqrRange = newRange;
              });
            },
            min: 10,
            max: 1000,
            activeColor: Colors.blue[900],
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"10 m² ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                r"1000 m² ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Khu vực",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              DropdownButton(
                value: chooseQuanHuyen,
                onChanged: (newValue) {
                  setState(() {
                    chooseQuanHuyen = newValue as String;
                  });
                },
                items: listQuanHuyen
                    .map((newValue) => DropdownMenuItem(
                          child: Text(
                            newValue,
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                          value: newValue,
                        ))
                    .toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hướng nhà",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton(
                value: chooseHuongNha,
                onChanged: (newValue) {
                  setState(() {
                    chooseHuongNha = newValue as String;
                  });
                },
                items: listHuongNha
                    .map((newValue) => DropdownMenuItem(
                          child: Text(
                            newValue,
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                          value: newValue,
                        ))
                    .toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      )),
                  child: TextButton(
                      onPressed: () {
                        print("aaaaaaa");
                      },
                      child: Text(
                        "Tìm kiếm",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({required this.title, this.value = false});
}
