//example interface in dart

//  interface Animal
abstract class Animal {
  void makeSound();
  void eat();
}

class Dog implements Animal {
  @override
  void makeSound() {
    print("Woof! Woof!");
  }

  @override
  void eat() {
    print("Dog is eating.");
  }

  void foot() {
    print("Dog has 4 foots.");
  }
}

class Cat implements Animal {
  @override
  void makeSound() {
    print("Meow!");
  }

  @override
  void eat() {
    print("Cat is eating.");
  }

  void chirp() {
    print("Cat chirps.");
  }
}

void main() {
  Dog myDog = Dog();
  myDog.makeSound();
  myDog.eat();
  myDog.foot();

  Cat myCat = Cat();
  myCat.makeSound();
  myCat.eat();
  myCat.chirp();
}
