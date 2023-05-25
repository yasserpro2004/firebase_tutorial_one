import 'package:flutter/material.dart';

class RoundBottomBar extends StatelessWidget {
  const RoundBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageView();
  }
}

class PageView extends StatelessWidget {
  const PageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: const Center(
        child: Text(
          'Hello There',
          style: TextStyle(fontSize: 36),
        ),
      ),
      // implement BottomAppBar
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        notchMargin: 5,
        // make rounded corners & create a notch for the floating action button
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          StadiumBorder(),
        ),
        child: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 36),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.history)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
          ),
        ),
      ),

      // implement the big floating action button
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
      // position the floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
