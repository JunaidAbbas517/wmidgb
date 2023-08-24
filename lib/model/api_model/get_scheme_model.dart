class GetSchemeModel {
  List<Data>? data;
  GetSchemeModel(
      {
        this.data,
      });

  GetSchemeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? cost;
  int? duration;
  int? population;
  String? detail;
  int? budget;
  String? documentation;
  String? assets;
  int? latitude;
  int? longitude;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.cost,
        this.duration,
        this.population,
        this.detail,
        this.budget,
        this.documentation,
        this.assets,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cost = json['cost'];
    duration = json['duration'];
    population = json['population'];
    detail = json['detail'];
    budget = json['budget'];
    documentation = json['documentation'];
    assets = json['assets'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['duration'] = this.duration;
    data['population'] = this.population;
    data['detail'] = this.detail;
    data['budget'] = this.budget;
    data['documentation'] = this.documentation;
    data['assets'] = this.assets;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

