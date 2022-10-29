// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/pages/util/my_button.dart';
import 'package:walletappui/pages/util/my_card.dart';
import 'package:walletappui/pages/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),

                  //plus button
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.grey[400], shape: BoxShape.circle),
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(height: 25),
            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMoth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 342.21,
                    cardNumber: 12345678,
                    expiryMoth: 11,
                    expiryYear: 23,
                    color: Colors.blue[400],
                  ),
                  MyCard(
                    balance: 420.22,
                    cardNumber: 12345678,
                    expiryMoth: 12,
                    expiryYear: 22,
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),

            SizedBox(height: 20),

            //3buttons => Send + Pay + Bills

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  Mybutton(
                    iconImagePath: 'lib/icons/send-money.png',
                    buttonText: 'Send',
                  ),
                  //pay button
                  Mybutton(
                    iconImagePath: 'lib/icons/credit-card.png',
                    buttonText: 'Pay',
                  ),
                  //bills button
                  Mybutton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: 'Bills',
                  ),
                ],
              ),
            ),

            //column =>stats + transactions

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //Statistics
                  MyListTile(
                    iconImagePath: 'lib/icons/analysis.png',
                    tileTitle: 'Statistics',
                    tileSubTitle: 'Payment and Income',
                  ),

                  //transaction
                  MyListTile(
                    iconImagePath: 'lib/icons/transaction.png',
                    tileTitle: 'Transactions',
                    tileSubTitle: 'Transaction History',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
