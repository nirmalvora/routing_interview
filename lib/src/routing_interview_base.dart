// TODO: Put public facing types in this file.
import 'dart:core';
/// Checks if you are awesome. Spoiler: you are.
class RouteSorting {
  Map<String, dynamic> sortKeys(Map<List<String>, dynamic> routeData) {
     Map<String, dynamic> finalData= {};
     routeData.entries.toList().forEach((data)=>finalData[data.key[0]]=data.value);
   
    var sortedByKeyMap =
        Map.fromEntries(finalData.entries.toList()..sort(compare));

    return sortedByKeyMap;
  }

  int compare(MapEntry route1, MapEntry route2) {
    String a = route1.key;
    String b = route2.key;
    String aStr = a.toString().toLowerCase();
    String bStr = b.toString().toLowerCase();

    // Alphanumeric elements always come before non-alphanumeric elements
    int aIsAlphanumeric = notStartWithColon(aStr);
    int bIsAlphanumeric = notStartWithColon(bStr);
    // print("$aStr $aIsAlphanumeric  $bStr  $bIsAlphanumeric");

    if (aIsAlphanumeric + bIsAlphanumeric != -2) {
      if (aIsAlphanumeric * bIsAlphanumeric > 0) {
        if (aIsAlphanumeric == bIsAlphanumeric) {
          return aStr.compareTo(bStr);
        }
        return aIsAlphanumeric - bIsAlphanumeric;
      }
      if (aIsAlphanumeric > 0) {
        return -1;
      } else if (bIsAlphanumeric > 0) {
        return 1;
      }
    }

    // Numerical elements always come before alphabetic elements
    num? aNum = num.tryParse(a);
    num? bNum = num.tryParse(b);

    if (aNum != null && bNum != null) {
      return aNum.compareTo(bNum);
    } else if (aNum != null) {
      return -1;
    } else if (bNum != null) {
      return 1;
    }

    // In all other cases, default to usual sort order.
    return aStr.compareTo(bStr);
  }

  int notStartWithColon(String str) {
    RegExpMatch? match = RegExp(r'^[\/,*,:]{1,}').firstMatch(str);

    if (match == null) {
      return -1;
    }

    int i = match.group(0)!.length;
    int count = 0;

    while (i-- > 0) {
      String char = match.group(0)![i];

      if (char == '/') {
        if (str == '/') {
          count += 6;
        } else {
          count += 3;
        }
      } else if (char == ':') {
        count++;
      } else if (char == '*') {
        count += 2;
      }
    }

    return count;
  }

}
