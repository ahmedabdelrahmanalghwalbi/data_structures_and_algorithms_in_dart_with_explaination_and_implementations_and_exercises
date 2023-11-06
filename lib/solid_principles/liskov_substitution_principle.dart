//Liskov Substitution Principle (Lsp)
// if you are substitute any type with one of its subtypes the behavior should not change.
//معناه ان لو عندي كلاسين الاب والابن والابن وارث من الاب فلازم يكون للإبن القدرة علي تنيذ كل الخصائص للاب .
//بمعني عندي كلاس الاب بيعمل شاي فلازم لما اطلب من الابن شاي ميقةليش مش هعرف ... لازم يعرف يعمل شاي زي ابوه
//The Liskov Substitution Principle (LSP) states that objects of a superclass should be able to be replaced with objects of a subclass
//without affecting the correctness of the program. In other words,
//a subclass should be able to replace its superclass without breaking the code

//-------------------------------------BEFORE LSP
class UploadFileService {
  void uploadFile() {
    print("File Parent Class ===> upload file .....");
  }
}

class UploadVideo extends UploadFileService {
  void uploadVideo() {
    print("Video Child Class ===> upload Video .....");
  }
}

class UploadImage extends UploadFileService {
  void uploadImage() {
    print("Image Child Class ===> upload Image .....");
  }
}

void main() {
  final data = ['file.pdf', 'video.mp4', 'image.png'];
  late UploadFileService uploadFileService;
  for (final item in data) {
    if (item.endsWith('mp4')) {
      uploadFileService = UploadVideo();
    } else if (item.endsWith('png')) {
      uploadFileService = UploadImage();
    } else {
      uploadFileService = UploadFileService();
    }

    uploadFileService.uploadFile();
  }
} //output
//parent class : Uploading file
//parent class : uploading file
//parent class : uploading file

//--------------------------------------- AFTER LSP
// فوق انا عرفت كل كلاس بالميثود بتاعته بعيد عن الميثود الأساسية للاب فالبتالي هاجي اغير في الاب ولحلول اعمل اكسس منه علي الابناء مش هيعرف يوصل وهيشغل الحاجة بتاعته عان انا اصلا مش عاملها override عند الابناء
//فالحل اني في الابناء معرفش ميثودس جديدة وانما استخدم ميثود الاب واعملها override عشان كل ابن يشغل الميثود بتاعه ابوه بالحاجة بتاعته
class UploadFileServiceeX {
  void uploadFile() {
    print("File Parent Class ===> upload file .....");
  }
}

class UploadVideoEX extends UploadFileServiceeX {
  @override
  void uploadFile() {
    print("Video Child Class ===> upload Video .....");
  }
}

class UploadImageEx extends UploadFileServiceeX {
  @override
  void uploadFile() {
    print("Image Child Class ===> upload Image .....");
  }
}

void mainEx() {
  final data = ['file.pdf', 'video.mp4', 'image.png'];
  late UploadFileService uploadFileService;
  for (final item in data) {
    if (item.endsWith('mp4')) {
      uploadFileService = UploadVideo();
    } else if (item.endsWith('png')) {
      uploadFileService = UploadImage();
    } else {
      uploadFileService = UploadFileService();
    }

    uploadFileService.uploadFile();
  }
} //output
//parent class : Uploading file
//Video child class : uploading video
//image child class : uploading image.
