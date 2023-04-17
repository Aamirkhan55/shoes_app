import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();

   @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(''),
                 ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F9FD),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ]
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 27,
                    color: Color(0xFF475269),
                    ),
                  const SizedBox(width: 10),
                  Container(
                    width: 250,
                    child: TextFormField(
                      controller:  _emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border:  InputBorder.none,
                        hintText: 'Enter Email',
                      ),
                    ),
                  ),
                ],
              ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F9FD),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ]
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock,
                    size: 27,
                    color: Color(0xFF475269),
                    ),
                  const SizedBox(width: 10),
                  Container(
                    width: 250,
                    child: TextFormField(
                      controller: _passwordController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border:  InputBorder.none,
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                ],
              ),
              ) ,
              const SizedBox(height: 10), 
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password',
                     style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF475269),
                     ),
                    )
                  ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                 Navigator.pushNamed(context, 'homeScreen');
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF475269),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow:const [
                      BoxShadow(
                        color: Color(0xFF475269),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ]
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ) ,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account ?",
                    style: TextStyle(
                      color: const Color(0xFF475269).withOpacity(0.8),
                      fontSize: 16,
                    ),
                    ),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text(
                      'Sign Up',
                       style : TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                         color: Color(0xFF475269),
                       ),
                      ),
                    )
                ],
                )
            ],
          )
        ) 
        ),
    );
  }
}