import 'package:get/get.dart';
import 'package:social_media_app/screen/ExplorePage.dart';
import 'package:social_media_app/screen/HomePage.dart';
class route {
static const String  HomePage1 = "/Homepage";
static const String  ExplorePage2 = "/ExplorePage";




static String  GetExplorePage()=>'$ExplorePage2';
static String  GetHomePage()=>'$HomePage1';



static List<GetPage> Route=[
GetPage(name: ExplorePage2 , page:() {
//pass pageid to the screen
return ExplorePage();
},
//حركة الانتقال من الصفحة للصفحة الاخرى
transition: Transition.downToUp
),
//---------------------------------------------//
GetPage(name: HomePage1 , page:() {
//pass pageid to the screen
return HomePage();
},
//حركة الانتقال من الصفحة للصفحة الاخرى
transition: Transition.downToUp
),
//---------------------------------------------//
];
}
