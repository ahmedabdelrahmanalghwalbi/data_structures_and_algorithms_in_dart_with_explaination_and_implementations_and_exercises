//----------------------------- Dependency inversion principle
//1- high level modules should not depend upon low level modules
//2-بمعني لو عندي كلاس  وبيقولي انا استطيع قطع الخبار إستخدام قطاعة الخيار الفقط ولا استطيع قطع الخيار الا بها او بشئ اخر فلازم اخليه يقولي اني بعرف اقطع الخيار بأي أداه اجبهاله مش لازم قطاعة خيار زي ما قالي في الاول
//3- عند تنفيذه في الكود يسمي dependency injection
//4- Depend upon abstractions,[not] concretions.
//<------------------------------- Before DIP>

//high level
class Email {
  final GmailService _gmailService = GmailService();
  final OutlockService _outlokService = OutlockService();

  void sendEmailByGmail() => _gmailService.sendEmail('Say Hello', 'Hello');
  void sendEmailByOutlok() => _outlokService.sendEmail('Say Hello', 'Hello');
}

//low level
class GmailService {
  void sendEmail(String title, String content) {
    //implemenetation
  }
}

//low level
class OutlockService {
  void sendEmail(String title, String content) {
    //implemenetation
  }
}

//<------------------------------------ after DIP>
//1- الحل اني اعمل زي كوبري او وصلة ما بين ال high level و ال low level
//2- الوصلة دي هتكون عبارة عن abstraction

//الوصلة
abstract class IMessage {
  void sendEmail(String title, String content);
}

//high level
class EmailEx {
  final IMessage messageService;
  const EmailEx(this.messageService);

  void sendEmail(String title, String content) {
    messageService.sendEmail(title, content);
  }
}

//low level
class GmailServiceEx implements IMessage {
  @override
  void sendEmail(String title, String content) {
    // TODO: implement sendEmail AS A GMAIL WAY
    print("gmail Service enabeled ..... ");
  }
}

//low level
class OutlockServiceEx implements IMessage {
  @override
  void sendEmail(String title, String content) {
    // TODO: implement sendEmail AS outlok WAY
    print("Outlok Service enabeled ..... ");
  }
}
//هنا بقي طريقه تنفيذه واللي بتعتمد علي ال DI وهي ال constracture injectection

void main() {
  //first i will inject gmail message type
  final emailFromGmail = EmailEx(GmailServiceEx());
  emailFromGmail.sendEmail(
      'hi from gmail', 'gmail messaging service enabeled >>>');
  //second i will inject outlok message type
  final emailFromOutlok = EmailEx(OutlockServiceEx());
  emailFromOutlok.sendEmail(
      'hi from outlok', 'outlok messaging service enabeled >>>');
}
//فبكدة قدرت اخلي فيه وسيط ما بين الهاي ليفل و اللو ليفل من خلال ابستراكت كلاس ولما بعوز استخدم حاجة معينه بعملها انجيكت داخل الوسيط اللي هو الابستركت كلاس 
//من امثلتها وليكن بستخدم عندي اكتر من سيرفيس بروفايدر عشان ابعت او تو بي وليكن عندي فايربيس ويوني فونيك فبحاول اطبق عليهم نفس المفهوم
/*
How does this code violate the Dependency Inversion Principle?
 class PizzaShop {
    getPayment() {}
    deliverPizza() {}
}
 class Customer {
 makePayment() {} 
 receivePizza() {}
}
class Delivery {
constructor(customer: Customer, pizzaShop: PizzaShop) { }
deliver() {
customer.makePayment
coffeeShop.getPayment
coffeeShop.deliverCoffee
customer.receiveCoffee
}
}    ? 
The provided code violates the Dependency Inversion Principle (DIP). The DIP states that high-level modules should not 
depend on low-level modules, and both should depend on abstractions. Additionally, abstractions should not depend on details;
rather, details should depend on abstractions.In the given code, the Delivery class is directly dependent on the Customer and
PizzaShop classes, which are both concrete, low-level modules. This violates the DIP because the Delivery class should not
depend directly on these concrete classes.
To adhere to the Dependency Inversion Principle, you should introduce abstractions for the Customer and PizzaShop classes
and have the Delivery class depend on these abstractions rather than the concrete implementations.
This way, the Delivery class would be decoupled from the specific implementations of Customer and PizzaShop,
allowing for more flexibility, easier maintenance, and better adherence to the DIP.

 */