import '../controllers/controllers.dart';
import '../core/classes/classes.dart';
import '../views/example/example_views.dart';
import '../views/views.dart';

class Routes extends RouteManager {
  Routes() {
    addAll(App().routes);
  }
}

class App extends RouteManager {
  static const String name = '';
  static const String home = '${App.name}/';
  static const String loadMore = '${App.name}/load-more';
  static const String sqlCrud = '${App.name}/sql-crud';
  static const String example = '${App.name}/examples';
  static const String setting = '${App.name}/setting';
  // Examples
  static const String exampleAuth = "/auth";
  static const String exampleGridView = "/grid-view";
  static const String exampleLoadLocalImage = "/load-local-image";
  static const String exampleLoadLocalJson = "/load-local-json";
  static const String exampleLoadMoreUsingApi = "/load-more-using-api";
  static const String exampleButtons = "/buttons-example";
  static const String exampleInputFields = "/input-fields-example";
  static const String exampleUsingAlertDialog = "/using-alert-dialog-example";
  static const String exampleUsingBottomNavBar = "/using-bottom-nav-bar";
  App() {
    addRoute(App.home, (context) => const HomeController());
    addRoute(App.setting, (context) => const SettingController());
    addRoute(App.loadMore, (context) => const LoadMoreController());
    addRoute(App.sqlCrud, (context) => const SqlCRUDView());
    addRoute(App.example, (context) => const ExampleController());
    // Examples
    addRoute(App.exampleAuth, (context) => const AuthView());
    addRoute(App.exampleGridView, (context) => GridViewPage());
    addRoute(App.exampleLoadLocalImage, (context) => LoadLocalImagePage());
    addRoute(App.exampleLoadLocalJson, (context) => LoadLocalJSONPage());
    addRoute(App.exampleLoadMoreUsingApi, (context) => LoadMoreUsingAPIPage());
    addRoute(App.exampleButtons, (context) => ButtonsExample());
    addRoute(App.exampleInputFields, (context) => InputFieldsExample());
    addRoute(App.exampleUsingAlertDialog, (context) => UsingAlertDialogView());
    addRoute(
        App.exampleUsingBottomNavBar, (context) => UsingBottomNavBarView());
  }
}
