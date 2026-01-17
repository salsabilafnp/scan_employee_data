import 'package:get/get.dart';
import 'package:scan_employee_data/app/modules/home/views/home_page.dart';
import 'package:scan_employee_data/app/modules/home/views/setting_page.dart';
import 'package:scan_employee_data/app/modules/makloon/views/makloon_page.dart';
import 'package:scan_employee_data/app/modules/scan/views/scan_page.dart';
import 'package:scan_employee_data/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => HomePage()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.setting, page: () => SettingPage()),
    GetPage(name: AppRoutes.scanKtp, page: () => ScanPage()),
    GetPage(name: AppRoutes.employeeData, page: () => HomePage()),
    GetPage(name: AppRoutes.detailEmployee, page: () => HomePage()),
    GetPage(name: AppRoutes.makloonData, page: () => MakloonPage()),
    GetPage(name: AppRoutes.detailMakloon, page: () => HomePage()),
  ];
}