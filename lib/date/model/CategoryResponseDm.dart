import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDm({
      super.results,
      super.metadata,
      super.data,
      this.statusMsg,
    this.message,
  });

  CategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDm.fromJson(v));
      });
    }
  }
  String? message ;
  String? statusMsg ;


}

class CategoryOrBrandDm extends CategoryOrBrandEntity {
  CategoryOrBrandDm({
      super.id,
      super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,});

  CategoryOrBrandDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class MetadataDm extends MetadataEntity {
  MetadataDm({
      super.currentPage,
      super.numberOfPages,
      super.limit,});

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

} 