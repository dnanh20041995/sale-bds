import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_customer.dart';
import 'package:flutter_application_1/screens/add_data_screen.dart';
import 'package:flutter_application_1/screens/list_customer_screen.dart';
import 'package:flutter_application_1/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          Search(),
          ListCustomer(),
          AddProductScreen(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.note_alt_outlined,
              color: _tabController!.index == 0 ? Colors.blue : Colors.grey,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person_pin_sharp,
              color: _tabController!.index == 1 ? Colors.blue : Colors.grey,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.add_business_outlined,
              color: _tabController!.index == 2 ? Colors.blue : Colors.grey,
            ),
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}
