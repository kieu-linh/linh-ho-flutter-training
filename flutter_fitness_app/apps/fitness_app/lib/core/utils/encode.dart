import 'package:encrypt/encrypt.dart';

class Encode {
  static String encryptPassword(String password) {
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final iv = IV.fromBase16('621db71ced565d4fcddcb445f0373b5d');

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    return encrypted.base64;
  }

  static String decryptPassword(String encryptedPassword) {
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final iv = IV.fromBase16('621db71ced565d4fcddcb445f0373b5d');

    final encrypter = Encrypter(AES(key));

    final encrypted = Encrypted.fromBase64(encryptedPassword);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}
