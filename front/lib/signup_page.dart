// // просто страница с регистрацией - Фамилия Имя юзернейм
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String route = '/signup';

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
  void _showSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/signin');
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
              _menuItem(title: 'Домой'),
              _menuItem(title: 'О нас'),
            ],
          ),
          Row(
            children: [
              _signinButton(),
              const SizedBox(width: 40),
              _menuItem(title: 'Регистрация', isActive: true)
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
                if (title == 'Домой') _showSignIn(context);
                if (title == 'О нас') _showUs(context);
                if (title == 'Войти') _showSignIn(context);
              },
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.deepPurple : Colors.grey,
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

  Widget _signinButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 238, 238, 238),
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            return states.contains(MaterialState.disabled)
                ? null
                : Colors.white;
          }),
        ),
        onPressed: () {
          _showSignIn(context);
        },
        child: const Text(
          'Войти',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
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
  void _showPersonalHome() {
    Navigator.pushNamed(context, '/homepage');
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
              const Text(
                'Генератор документации',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'images/illustration-2.png',
                width: 300,
              ),
            ],
          ),
        ),
        Image.asset(
          'images/illustration-1.png',
          width: 300,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: SizedBox(
            width: 320,
            child: _formLogin(),
          ),
        )
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Имя',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: 'Электронная почта',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: 'Логин',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Пароль',
            suffixIcon: const Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 209, 196, 233),
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: _showPersonalHome,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Регистрация"))),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 209, 196, 233),
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: TextButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 172, 162, 188),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Назад"))),
          ),
        ),
        const SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Или продолжить с"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _signupWithButton(image: 'images/google.png'),
            _signupWithButton(image: 'images/github.png', isActive: true),
            _signupWithButton(image: 'images/facebook.png'),
          ],
        ),
      ],
    );
  }

  Widget _signupWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 218, 218, 218),
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color.fromARGB(255, 232, 231, 231)),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 189, 189, 189),
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : const BoxDecoration(),
        child: Image.asset(
          image,
          width: 35,
        ),
      )),
    );
  }
}
