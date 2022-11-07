import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 100,
    height: 100,
    color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: const Color.fromARGB(255, 3, 24, 41).withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(255, 3, 24, 41),
      ),
      labelText: text,
      labelStyle:
      TextStyle(color: const Color.fromARGB(255, 3, 24, 41).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 124, 197, 241).withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () => onTap(),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return const Color.fromARGB(255, 233, 170, 190);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Widget roundedStatDisplay(Color color, List<Widget> childrenWidgets) {
  return SingleChildScrollView(
    child: Container(
      alignment: Alignment.center,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color, width: 10),
          borderRadius: BorderRadius.circular(75)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: childrenWidgets,
        ),
      ),
    ),
  );
}

Widget paddedHeader(String text, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 25),
    ),
  );
}

Widget pictureCard(String imageLink) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    alignment: Alignment.center,
    height: 250,
    width: 400,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(imageLink),
            fit: BoxFit.cover)),
  );
}

Widget postTextContent(String title, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Text(text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.justify
        ),
      ],
    ),
  );
}

// Helper method to show SnackBar
Future showMessage(BuildContext context, String message, {int duration = 3}) async {
  await Future.delayed(const Duration(milliseconds: 100));
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      duration: Duration(seconds: duration),
    ),
  );
}
