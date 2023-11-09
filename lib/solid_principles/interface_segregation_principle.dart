//<---------------------------- Interface Segregation Principle>
//1- نبتعد عن إضافة كل الفنكشنز في كلاس واحد
//2- نضيف الفانكشنز اللي يحتاجها الكلاس فقط ( يشبه اول مفهوم اللي هو Single Responsibility Principle)
//3- بالعامية كده وليكن عندي كلاسين واحد فيعم يمكنه الدوران والاخر لا وجيت قولت كل الكلاسات تدور هييجي اللي ميعرفش يدور ويقول انا عندي مشكلة في الدوران ومبعرفش ادور ويحصل مشكله .
//4-هنا ييجي دور ال Interface Segregation Principle بحيث بييجي يقول الكلاسات اللي بتعرف تدور تدور بس فالبتالي فصل كل كلاس بالفنشكنز والقدرات بتاعته عن التاني فكده مش هيحصلي مشكله

//<--------------------------- Before Interface Segregation Principle Implemenetation>
//
//
abstract class IPayment {
  void payWithApplePay();
  void payWithGooglePay();
  void payWithCreditCard();
}

//هنا في الاندرويد معندوش امكانيه التعامل مع الابل او الكريتدت فليه هنا جابرني اعملهم تطبيق وانا كده كده مش هقدر اطبقهم
class AndroidPayment implements IPayment {
  @override
  void payWithApplePay() {
    // TODO: implement payWithApplePay
  }

  @override
  void payWithCreditCard() {
    // TODO: implement payWithCreditCard
  }

  @override
  void payWithGooglePay() {
    // TODO: implement payWithGooglePay
  }
}
//هنا في الايفون معندوش امكانيه التعامل مع جوجل او الكريتدت فليه هنا جابرني اعملهم تطبيق وانا كده كده مش هقدر اطبقهم

class IosPayment implements IPayment {
  @override
  void payWithApplePay() {
    // TODO: implement payWithApplePay
  }

  @override
  void payWithCreditCard() {
    // TODO: implement payWithCreditCard
  }

  @override
  void payWithGooglePay() {
    // TODO: implement payWithGooglePay
  }
}
//هنا في الكريتدت معندوش امكانيه التعامل مع الابل او جوجل فليه هنا جابرني اعملهم تطبيق وانا كده كده مش هقدر اطبقهم

class CreditPayment implements IPayment {
  @override
  void payWithApplePay() {
    // TODO: implement payWithApplePay
  }

  @override
  void payWithCreditCard() {
    // TODO: implement payWithCreditCard
  }

  @override
  void payWithGooglePay() {
    // TODO: implement payWithGooglePay
  }
}

//<--------------------------- After Interface Segregation Principle Implemenetation>
//
//
//الحل اني اقسم الانترفيس يتاعي اللي هو الابستراكت كلاس  إلي مجموعة انترفيسيس بحيث كل كلاس لما يعمل امبليمينت من انترفيس يكون للفنكشنز اللي هيحتاجها بس مش لازم كله اللي هيحتاجه واللي مش هيحتاجه
//هنقسم الانترفيس ده لتلاته انترفيسيس
// abstract class IPayment {
//   void payWithApplePay();
//   void payWithGooglePay();
//   void payWithCreditCard();
// }

abstract class ApplePaymentI {
  void payWithApplePay();
}

abstract class GooglePaymentI {
  void payWithGooglePay();
}

abstract class CrieditPayment {
  void paymentWithCriedit();
}

class AndroidPaymentAfterIsp implements GooglePaymentI {
  @override
  void payWithGooglePay() {
    // TODO: implement payWithGooglePay
  }
}

class IosPaymentAfterIsp implements ApplePaymentI {
  @override
  void payWithApplePay() {
    // TODO: implement payWithApplePay
  }
}

class CreditPaymentAfterISP implements CrieditPayment {
  @override
  void paymentWithCriedit() {
    // TODO: implement paymentWithCriedit
  }
}
