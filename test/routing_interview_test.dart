import 'package:routing_interview/routing_interview.dart';
import 'package:test/test.dart';
import 'package:inline_snapshot/inline_snapshot.dart';
import 'dart:core';
void main() {
   tearDownAll(() async {
    await Expect.apply();
  });
  group('A group of tests', () {
    var routeSorting = RouteSorting();
    const routerConfig = {
        ["//menu"]: {"exact": true, "component": MyComponent},
        ["/login"]: {"exact": true, "component": MyComponent},
        ["/callback"]: {"exact": true, "component": MyComponent},
        ["/:orgName/usermenu/logout"]: {
          "exact": true,
          "component": MyComponent
        },
        ["/"]: {"exact": false, "component": MyComponent},
        ["/:orgName/usermenu/profile"]: {
          "exact": true,
          "component": MyComponent
        },
        ["/authenticate-popup"]: {"exact": true, "component": MyComponent},
        ["/reset-password"]: {"exact": true, "component": MyComponent},
        ["/:orgName/usermenu/account/"]: {
          "exact": false,
          "component": MyComponent
        },
        ["/o/orgname2"]: {"exact": false, "component": MyComponent},
        ["/o/profile"]: {"exact": true, "component": MyComponent},
        ["/o/profile/upload-photo"]: {
          "exact": true,
          "component": MyComponent
        },
        ["/o/:orgName/account/line/"]: {
          "exact": false,
          "component": MyComponent
        },
        ["/o/:orgName/account/line2/"]: {
          "exact": false,
          "component": MyComponent
        },
        ["/o/orgname"]: {"exact": false, "component": MyComponent},
      };
      test('First Test', () {
        var sortedRoutes=routeSorting.sortKeys(routerConfig);
        var firstKey = sortedRoutes.entries.toList()[0].key;
        // print(sortedRoutes);
        var keyTest = Expect("/authenticate-popup");
        keyTest.eq(firstKey.toString());
        var routeTest = Expect("{/authenticate-popup: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /callback: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /login: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /o/:orgName/account/line/: {exact: false, component: Closure: () => void from Function 'MyComponent': static.}, /o/:orgName/account/line2/: {exact: false, component: Closure: () => void from Function 'MyComponent': static.}, /o/orgname: {exact: false, component: Closure: () => void from Function 'MyComponent': static.}, /o/orgname2: {exact: false, component: Closure: () => void from Function 'MyComponent': static.}, /o/profile: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /o/profile/upload-photo: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /reset-password: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /:orgName/usermenu/account/: {exact: false, component: Closure: () => void from Function 'MyComponent': static.}, /:orgName/usermenu/logout: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /:orgName/usermenu/profile: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}, /: {exact: false, component: Closure: () => void from Function 'MyComponent': static.}, //menu: {exact: true, component: Closure: () => void from Function 'MyComponent': static.}}");
        routeTest.eq(sortedRoutes.toString());
      });
  });
}

void MyComponent(){
  
}