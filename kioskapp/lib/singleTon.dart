class Singleton{
  static final Singleton _instance = Singleton._internal();
  int countMenu;

  factory Singleton(){
    return _instance;
  }

  Singleton._internal(){
    countMenu = 1;
  }
}

class SingletonTwo{
  static final SingletonTwo _instanceTwo = SingletonTwo._internal();
  int selectedAgeGroup;

  factory SingletonTwo(){
    return _instanceTwo;
  }

  SingletonTwo._internal(){
    selectedAgeGroup = 1;
  }
}