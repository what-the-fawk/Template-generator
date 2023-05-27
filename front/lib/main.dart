import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'personal_page.dart';
import 'bout_us.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/': (context) => WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
        WelcomeScreen.route: (context) => const WelcomeScreen(),
        PersonalPage.route: (context) => const PersonalPage(),
      },
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// // class SignUpScreen extends StatelessWidget {
// //   const SignUpScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       backgroundColor: Color.fromARGB(255, 203, 244, 181),
// //       body: Center(
// //         child: SizedBox(
// //           width: 400,
// //           child: Card(
// //             child: SignUpForm(),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class RegScreen extends StatelessWidget {
//   const RegScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color.fromARGB(255, 203, 244, 181),
//       body: Center(
//         child: SizedBox(
//           width: 400,
//           child: Card(
//             child: RegForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class WelcomeScreen extends StatelessWidget {
// //   const WelcomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             ElevatedButton(
// //               child: Text('Log in',
// //                   style: Theme.of(context).textTheme.displayMedium),
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => const SignUpScreen()),
// //                 );
// //               },
// //             ),
// //             ElevatedButton(
// //               child: Text('Sign up',
// //                   style: Theme.of(context).textTheme.displayMedium),
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => const RegScreen()),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class SignUpForm extends StatefulWidget {
//   const SignUpForm({super.key});

//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _passwordTextController = TextEditingController();
//   final _usernameTextController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   // ignore: unused_element
//   void _showWelcomeScreen() {
//     Navigator.of(context as BuildContext).pushNamed('/home');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // LinearProgressIndicator(value: _formProgress),
//           Text('Log in', style: Theme.of(context).textTheme.headlineMedium),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _usernameTextController,
//               decoration: const InputDecoration(
//                   icon: Icon(Icons.account_circle_outlined),
//                   hintText: 'Username',
//                   labelText: "Username *"),
//               // onSaved: (String? value) {}), // TODO: должно запихивать в БД
//               // validator: (String? value) {
//               // TODO:проверка ввода
//               //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//               // },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Enter username';
//                 }
//                 return null;
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               obscureText: true,
//               controller: _passwordTextController,
//               decoration: const InputDecoration(
//                   icon: Icon(Icons.key_sharp),
//                   hintText: 'Password',
//                   labelText: "Password *"),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Enter your password';
//                 }
//                 return null;
//               },
//             ),
//           ),
//           Row(
//             // mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextButton(
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : Colors.white;
//                   }),
//                   backgroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : const Color.fromARGB(255, 112, 181, 237);
//                   }),
//                 ),
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')),
//                     );
//                     _showWelcomeScreen;
//                   }
//                 },
//                 child: const Text('Sign in'),
//               ),
//               TextButton(
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : Colors.white;
//                   }),
//                   backgroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : Color.fromARGB(255, 172, 196, 216);
//                   }),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Go back'),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String route = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 238, 238),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: const [
          Menu(),
          // MediaQuery.of(context).size.width >= 980
          //     ? Menu()
          //     : SizedBox(), // Responsive
          Body()
        ],
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
  void _showSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
  }

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
              _menuItem(title: 'Home'),
              _menuItem(title: 'About us'),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Sign In', isActive: true),
              _registerButton()
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
                if (title == 'Home') _showSignIn(context);
                if (title == 'About us') _showUs(context);
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

  Widget _registerButton() {
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
          _showSignUp(context);
        },
        child: const Text(
          'Register',
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
  void _showSignUp() {
    Navigator.of(context).pushNamed('/signup');
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
                'Sign In to \nMy Application',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "If you don't have an account",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "You can",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _showSignUp();
                    },
                    child: const Text(
                      "Register here!",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
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
        // MediaQuery.of(context).size.width >= 1300 //Responsive
        //     ? Image.asset(
        //         'images/illustration-1.png',
        //         width: 300,
        //       )
        //     : SizedBox(),
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
            hintText: 'Enter email or Phone number',
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
            hintText: 'Password',
            counterText: 'Forgot password?',
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
          child: ElevatedButton(
            onPressed: () => print("it's pressed"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
                width: double.infinity,
                height: 50,
                child: const Center(child: Text("Sign In"))),
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
            child: Text("Or continue with"),
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
            _loginWithButton(image: 'images/google.png'),
            _loginWithButton(image: 'images/github.png', isActive: true),
            _loginWithButton(image: 'images/facebook.png'),
          ],
        ),
      ],
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
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
