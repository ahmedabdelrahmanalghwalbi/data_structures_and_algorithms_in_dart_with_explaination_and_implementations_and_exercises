//----------------------------- Dependency inversion principle
//1- high level modules should not depend upon low level modules
//2-بمعني لو عندي كلاس  وبيقولي انا استطيع قطع الخبار إستخدام قطاعة الخيار الفقط ولا استطيع قطع الخيار الا بها او بشئ اخر فلازم اخليه يقولي اني بعرف اقطع الخيار بأي أداه اجبهاله مش لازم قطاعة خيار زي ما قالي في الاول
//3- عند تنفيذه في الكود يسمي dependency injection
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