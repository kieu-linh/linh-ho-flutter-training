

String twoFer(String name) {
  if (name == '') {
    return 'One for you, one for me.';
  } else {
    return 'One for $name, one for me.';
  }
}

void main() {
  print(twoFer(''));
}
