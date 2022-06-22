class FoodNames {
  List<Names>? names;

  FoodNames({this.names});

  FoodNames.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Names {
  String? foodName;
  String? sweetName;

  Names({this.foodName, this.sweetName});

  Names.fromJson(Map<String, dynamic> json) {
    foodName = json['foodName'];
    sweetName = json['sweetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodName'] = foodName;
    data['sweetName'] = sweetName;
    return data;
  }
}
