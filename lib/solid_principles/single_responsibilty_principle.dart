//Single Raesponsibilty Principles (SRP): a class should have one job and one responsibilty

//--------------------------------- BEFORE CRP
class TransferMoney {
  void transferLocale() {
    //implementaion
    //then call sendSmsMessage
    sendSmsMessage();
  }

  void sendSmsMessage() {
    //implementation
  }

  void saveToDb() {
    //implementation
  }
}

//--------------------------------- AFTER CRP
class TranferMoney {
  final SmsService _sms = SmsService();
  final TransactionDb _trans = TransactionDb();
  void transferLocale() {
    _sms.sendSmsMessage();
    _trans.saveToDb();
  }
}

class SmsService {
  void sendSmsMessage() {
    //implementation
  }
}

class TransactionDb {
  void saveToDb() {
    //implementation
  }
}

//How does this code violate SRP? (Single Responsibility Principle)
class PizzaShop {
  constructor(String name, String city, int zipCode) {}
  getName() {}
  changeAddress(String city, int zipCode) {}
}
/*
This code violates the Single Responsibility Principle (SRP) because the PizzaShop class seems to be responsible
for more than one thing. According to the SRP, a class should have only one reason to change. In this case,
the PizzaShop class is handling multiple responsibilities:
1- Managing the details of the pizza shop (name, city, zip code) through the constructor ,
  and the changeAddress method.
2- Providing methods for accessing and modifying the details of the shop (getName and changeAddress).
To adhere to the SRP, it would be better to separate these responsibilities into different classes.
For example, you could have a PizzaShopDetails class responsible for managing the details of the shop,
and a PizzaShopController class responsible for providing methods to access and modify these details.
 */
