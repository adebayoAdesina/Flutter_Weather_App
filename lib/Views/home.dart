import 'package:flutter/material.dart';
import 'package:weather_app/Util/colors.dart';
import 'package:weather_app/Views/searched.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: mainColor,
        title: const Text(
          'Weather App',
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/image_processing20200703-17070-1fe42rn.gif'))),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        controller: userInput,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          fillColor: whiteColor,
                          filled: true,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: whiteColor,
                    ),
                    child: IconButton(
                        color: mainColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  Searched(city: userInput.text),
                            ),
                          );
                        },
                        icon: const Icon(Icons.search)),
                  )
                ]),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
