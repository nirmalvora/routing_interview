import 'package:routing_interview/routing_interview.dart';
import "dart:convert";


void main() {
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
  var routerNewConfig=routeSorting.sortKeys(routerConfig);
  print(routerNewConfig);
}

void MyComponent(){
  
}