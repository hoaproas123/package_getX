import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // It is not mandatory to use named routes, but dynamic urls are interesting.
    initialRoute: '/home',//màn hình mặc định khi chạy app, được dẫn bằng name router
    defaultTransition: Transition.native,//Hiệu ứng chuyển màn hình mặc định
    translations: MyTranslations(),
    locale: Locale('pt', 'BR'),
    getPages: [
      //Simple GetPage
      GetPage(name: '/home', page: () => First()
          // ,binding: SampleBind()
      ),
      // GetPage with custom transitions and bindings
      GetPage(
        name: '/second',
        page: () => Second(),//trang chuyển đổi
        customTransition: SizeTransitions(),
        binding: SampleBind(),//muốn sử dụng controller cần  khai bao binding

      ),
      // GetPage with default transitions
      GetPage(
        name: '/third',
        transition: Transition.upToDown,//animation chuyển đổi
        page: () => Third(),
      ),
    ],
  )
 );
}

class MyTranslations extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'title': 'Hello World %s',
    },
    'en_US': {
      'title': 'Hello World from US',
    },
    'pt': {
      'title': 'Olá de Portugal',
    },
    'pt_BR': {
      'title': 'Olá do Brasil',
    },
  };
}

class Controller extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
    // use update method to update all count variables
    update();
  }
}

class First extends StatelessWidget {//GetView<Controller>
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            print(Get.obs());//???
            // give the current args from currentScreen
            print(Get.arguments);//Trả về đối tượng chứa các tham số được truyền từ màn hình trước đó.

            // give name of previous route
            print(Get.previousRoute);//Trả về tên của màn hình trước đó

            // give the raw route to access for example, rawRoute.isFirst()
            print(Get.rawRoute);//Trả về thông tin chi tiết về route hiện tại, bao gồm cả các tham số và query parameters

            // give access to Routing API from GetObserver
            print(Get.routing);//Cung cấp quyền truy cập đến API quản lý routing, cho phép bạn thực hiện các thao tác như điều hướng đến màn hình khác.

            // check if snackbar is open
            // Get.snackbar("Hi", "I'm modern snackbar");//hiển thị snackbar
            print("is Snackbar Open: ${Get.isSnackbarOpen}");//Kiểm tra thanh snackbar có đang được mở không

            // check if dialog is open
            // Get.dialog(Center(child: Text('Hi')));//Hiển thị dialog
            print('isDialogOpen: ${Get.isDialogOpen}');//Kiếm tra dialog có đang được mở không

            // check if bottomsheet is open
            Get.bottomSheet(Text('haha',style: TextStyle(fontSize: 25),));//Hiện thị thanh dưới cùng màn hình
            print('isBottomSheetOpen: ${Get.isBottomSheetOpen}');//Kiểm tra bottomsheet có đăng được mở không

            // remove one route.
            // Get.removeRoute;//Xóa một route khỏi stack.

            // back repeatedly until the predicate returns true.
            Get.until((route) => Get.currentRoute=='/home');//Quay lại màn hình trước đó nhiều lần cho đến khi điều kiện được xác định trả về true.

            // go to next route and remove all the previous routes until the predicate returns true.
            // Get.offUntil(GetPageRoute(routeName: '/home'), (route) => Get.currentRoute=='/home',);//Điều hướng đến màn hình tiếp theo và xóa tất cả các màn hình trước đó cho đến khi điều kiện được xác định trả về true.

            // go to next named route and remove all the previous routes until the predicate returns true.
            // Get.offNamedUntil;//Điều hướng đến màn hình tiếp theo với tên đã định và xóa tất cả các màn hình trước đó cho đến khi điều kiện được xác định trả về true.

            //Kiểm tra nền tảng ứng dụng đang chạy
            print('isAndroid: ${GetPlatform.isAndroid}');
            print('isIOS: ${GetPlatform.isIOS}');
            print('isMacOS: ${GetPlatform.isMacOS}');
            print('isWindows: ${GetPlatform.isWindows}');
            print('isLinux: ${GetPlatform.isLinux}');
            print('isFuchsia: ${GetPlatform.isFuchsia}');

            //Check the device type
            print('isDesktop: ${GetPlatform.isDesktop}');
            print('isMobile: ${GetPlatform.isMobile}');
            //All platforms are supported independently in web!
            //You can tell if you are running inside a browser
            //on Windows, iOS, OSX, Android, etc.
            print('isWeb: ${GetPlatform.isWeb}');


            // Lấy kích thước màn hình, tương tự MediaQuery.of(context).size.height or width
            print('height: ${Get.height}');
            print('width: ${Get.width}');
            //cách 2
            print('context height: ${context.height}');
            print('context width: ${context.width}');


            // Gives the current context of the Navigator.
            print('context: ${Get.context}');

            // Gives the context of the snackbar/dialog/bottomsheet in the foreground, anywhere in your code.
            print('overlayContext: ${Get.overlayContext}');


            // Gives you the power to define half the screen, a third of it and so on.
            // Useful for responsive applications.
            // param dividedBy (double) optional - default: 1
            // param reducedBy (double) optional - default: 0
            print('heightTransformer: ${context.heightTransformer()}');
            print('widthTransformer: ${context.widthTransformer}');

            /// Similar to MediaQuery.of(context).size
            print('mediaQuerySize: ${context.mediaQuerySize}');//Trả về kích thước màn hình dựa trên MediaQuery.

            /// Similar to MediaQuery.of(context).padding
            print('mediaQueryPadding: ${context.mediaQueryPadding}');

            /// Similar to MediaQuery.of(context).viewPadding
            print('mediaQueryViewPadding: ${context.mediaQueryViewPadding}');

            /// Similar to MediaQuery.of(context).viewInsets;
            print('mediaQueryViewInsets: ${context.mediaQueryViewInsets}');

            //Kiểm tra chế độ hiển thị của thiết bị.
            print('orientation: ${context.orientation}');//Kiểm tra xem thiết bị đang ở chế độ ngang (landscape) hay dọc (portrait).
            print('isLandscape: ${context.isLandscape}');
            print('isPortrait: ${context.isPortrait}');

            /// Similar to MediaQuery.of(context).devicePixelRatio;
            print('devicePixelRatio: ${context.devicePixelRatio}');//Tỷ lệ pixel của thiết bị.

            /// Similar to MediaQuery.of(context).textScaleFactor;
            print('textScaleFactor: ${context.textScaleFactor}');

            /// Get the shortestSide from screen
            print('mediaQueryShortestSide: ${context.mediaQueryShortestSide}');

            /// True if width be larger than 800
            print('showNavbar: ${context.showNavbar}');

            /// True if the shortestSide is smaller than 600p
            print('isPhone: ${context.isPhone}');

            /// True if the shortestSide is largest than 600p
            print('isSmallTablet: ${context.isSmallTablet}');

            /// True if the shortestSide is largest than 720p
            print('isLargeTablet: ${context.isLargeTablet}');

            /// True if the current device is Tablet
            print('isTablet: ${context.isTablet}');

            /// Returns a value<T> according to the screen size
            /// can give value for:
            /// watch: if the shortestSide is smaller than 300
            /// mobile: if the shortestSide is smaller than 600
            /// tablet: if the shortestSide is smaller than 1200
            /// desktop: if width is largest than 1200
            print('responsiveValue: ${context.responsiveValue(mobile: 602,desktop: 1000)}');

          },
        ),
        title: Text("title".trArgs(['John'])),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(//thay thế cho setState, không cần khởi tạo binding để vẽ lại màn hình
                init: Controller(),
                // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                builder: (_) => Text(
                  'clicks: ${_.count}',
                )),
            // Obx(() => Text(
            //   'clicks: ${controller.count}',
            // ),),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');//chuyển màn hình tương từ navigator.pushname
                // Get.to(Second()); //Chuyển màn hình tương tự navigator.push
                // Get.back();//Chuyển màn hình về trang trước, tương tự navigator.pop
                // Get.off(Third());//Xóa màn hình hiện tại khỏi stack, chuyển đến màn hình được truyền vào
                // Get.offAll(Third());//Xóa tất cả màn hình hiện tại khỏi stack, chuyển đến màn hình được truyền vào
                
              },
            ),
            ElevatedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<Controller>().increment();//dùng để tìm và trả về một phiên bản đã khởi tạo của controller
          }),
    );
  }
}

class Second extends GetView<ControllerX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(//vẽ lại màn hình, thay thể setState
                  () {
                print("count1 rebuild");
                return Text('${controller.count1}');
              },
            ),
            Obx(
                  () {
                print("count2 rebuild");
                return Text('${controller.count2}');
              },
            ),
            Obx(() {
              print("sum rebuild");
              return Text('${controller.sum}');
            }),
            Obx(
                  () => Text('Name: ${controller.user.value?.name}'),
            ),
            Obx(
                  () => Text('Age: ${controller.user.value?.age}'),
            ),
            ElevatedButton(
              child: Text("Go to last page"),
              onPressed: () {
                Get.toNamed('/third', arguments: 'arguments of second');
              },
            ),
            ElevatedButton(
              child: Text("Back page and open snackbar"),
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'User 123',
                  'Successfully created',
                );
              },
            ),
            ElevatedButton(
              child: Text("Increment"),
              onPressed: () {
                controller.increment();
              },
            ),
            ElevatedButton(
              child: Text("Increment"),
              onPressed: () {
                controller.increment2();
              },
            ),
            ElevatedButton(
              child: Text("Update name"),
              onPressed: () {
                controller.updateUser();
              },
            ),
            ElevatedButton(
              child: Text("Dispose worker"),
              onPressed: () {
                controller.disposeWorker();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Third extends GetView<ControllerX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.incrementList(controller.sum);
      }),
      appBar: AppBar(
        title: Text("Third ${Get.arguments}"),
      ),
      body: Center(
          child: Obx(() => ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Center(child: Text("${controller.list[index]}",style: TextStyle(fontSize: 30),));
              }))),
    );
  }
}

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerX>(() => ControllerX());//dùng để chèn một controller vào bộ nhớ. Tuy nhiên, nó chỉ được gọi khi bạn thực sự sử dụng nó trong một view cụ thể hoặc khi bạn gọi nó
    // Get.lazyPut<Controller>(() => Controller());
  }
}

class User {
  User({this.name = 'Name', this.age = 0});
  String name;
  int age;
}

class ControllerX extends GetxController {
  var count1 = 0.obs;
  final count2 = 0.obs;
  final list = [56].obs;
  final user = User().obs;
  updateUser() {
    user.update((value) {
      value!.name = 'Jose';
      value.age = 30;
    });
  }

  /// Once the controller has entered memory, onInit will be called.
  /// It is preferable to use onInit instead of class constructors or initState method.
  /// Use onInit to trigger initial events like API searches, listeners registration
  /// or Workers registration.
  /// Workers are event handlers, they do not modify the final result,
  /// but it allows you to listen to an event and trigger customized actions.
  /// Here is an outline of how you can use them:

  /// made this if you need cancel you worker
  late Worker _ever;

  // @override
  // onInit() {
  //   _ever = ever(count1, (_) => print("$_ has been changed (ever)")); //gọi hàm callback mỗi khi giá trị của thay đổi.
  //   everAll([count1, count2], (_) => print("$_ has been changed (everAll)"));//Callback được gọi khi bất kỳ biến nào trong danh sách thay đổi.
  //
  //   once(count1, (_) => print("$_ was changed once (once)"));//gọi callback một lần duy nhất khi biến thay đổi lần đầu tiên.
  //
  //   debounce(count1, (_) => print("debouce$_ (debounce)"),
  //       time: Duration(seconds: 1));//Hàm này giúp tránh việc gọi callback quá nhiều lần trong khoảng thời gian ngắn.
  //
  //   interval(count1, (_) => print("interval $_ (interval)"),
  //       time: Duration(seconds: 20));//cho phép gọi callback sau mỗi khoảng thời gian cố định
  // }

  int get sum => count1.value + count2.value;

  increment() => count1.value++;

  increment2() => count2.value++;

  disposeWorker() {
    _ever.dispose();
    // or _ever();
  }
  incrementList(int num) => list.add(num);
}

class SizeTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: curve!,
        ),
        child: child,
      ),
    );
  }
}