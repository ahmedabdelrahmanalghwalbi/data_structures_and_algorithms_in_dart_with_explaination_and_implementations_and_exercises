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
