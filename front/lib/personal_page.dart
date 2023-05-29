import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 238, 238),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: const [Menu(), Body()],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // void _changeMe(BuildContext context) {
  //   Navigator.pushNamed(context, '/changes');
  // }

  void _showSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/signin');
  }

  void _showGen(BuildContext context) {
    Navigator.pushNamed(context, '/generator');
  }

  void _showUs(BuildContext context) {
    Navigator.pushNamed(context, '/us');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(title: 'К генератору'),
              _menuItem(title: 'О нас'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(title: 'Выйти'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.white;
                }),
              ),
              onPressed: () {
                if (title == 'К генератору') _showGen(context);
                if (title == 'О нас') _showUs(context);
                if (title == 'Выйти') _showSignIn(context);
              },
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _changeMe(BuildContext context) {
    Navigator.pushNamed(context, '/changes');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/illustration-2.png',
                width: 300,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: SizedBox(
            width: 320,
            child: _formLogin(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _changeMe;
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(child: Text("Редактировать"))),
            ),
          ],
        ),
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: const [
        SizedBox(
          width: 85,
          height: 30,
          child: Center(
            child: Text(
              "Имя",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 120, 120, 120),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 350,
          height: 20,
        ),
        SizedBox(
          width: 350,
          height: 30,
          child: Center(
            child: Text(
              "Фамилия",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 120, 120, 120),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 350,
          height: 20,
        ),
        SizedBox(
          width: 350,
          height: 30,
          child: Center(
            child: Text(
              "Почта",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 120, 120, 120),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 350,
          height: 20,
        ),
        SizedBox(
          width: 350,
          height: 30,
          child: Center(
            child: Text(
              "Логин",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 120, 120, 120),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // TextField(
        //   decoration: InputDecoration(
        //     hintText: 'Введите почту',
        //     filled: true,
        //     fillColor: Colors.blueGrey[50],
        //     labelStyle: const TextStyle(fontSize: 12),
        //     contentPadding: const EdgeInsets.only(left: 30),
        //     enabledBorder: OutlineInputBorder(
        //       borderSide:
        //           const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide:
        //           const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 30),
        // TextField(
        //   obscureText: true,
        //   decoration: InputDecoration(
        //     hintText: 'Пароль',
        //     suffixIcon: const Icon(
        //       Icons.visibility_off_outlined,
        //       color: Colors.grey,
        //     ),
        //     filled: true,
        //     fillColor: Colors.blueGrey[50],
        //     labelStyle: const TextStyle(fontSize: 12),
        //     contentPadding: const EdgeInsets.only(left: 30),
        //     enabledBorder: OutlineInputBorder(
        //       borderSide:
        //           const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide:
        //           const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
