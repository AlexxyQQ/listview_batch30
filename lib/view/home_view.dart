import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.green,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cow_%28Fleckvieh_breed%29_Oeschinensee_Slaunger_2009-07-07.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.10,
              bottom: -80,
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.amber,
                backgroundImage: NetworkImage(
                    "https://www.getdigital.eu/images/products/__generated__resized/1100x1100/20566OPM_saitama_pin_front.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
