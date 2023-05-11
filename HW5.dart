import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  print('Choose difficulty level: easy|medium|hard');
  String difficultyLevel = stdin.readLineSync().toString().toLowerCase();

  int minPasswordLength = 0;
  int maxPasswordLength = 0;

  switch (difficultyLevel) {
    case 'easy':
      minPasswordLength = 6;
      maxPasswordLength = 10;
      break;
    case 'medium':
      minPasswordLength = 10;
      maxPasswordLength = 15;
      break;
    case 'hard':
      minPasswordLength = 15;
      maxPasswordLength = 20;
      break;
    default:
      break;
  }


  // List<String> chars2 = [
  //   'abcdefghijklmnopqrstuvwxyz',
  //   'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  //   '0123456789',
  //   '!@#\$%^&*()'
  // ];
  // List<String> charList2 = chars2.expand((x) => x.split('')).toList();

  String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()';
  List<String> charList = chars.split('');

  charList.shuffle();

  int passwordLength =
      Random().nextInt(maxPasswordLength - minPasswordLength + 1) +
          minPasswordLength; // (20 - 15 + 1) + 15


  String password = List.generate(passwordLength,
      (index) => charList[Random().nextInt(charList.length)]).join('');

  String encodedPassword = base64UrlEncode(utf8.encode(password));

  print('Your random password is: $encodedPassword');
}
