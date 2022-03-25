class PhotoModel {
  PhotoModel({
    this.total,
    this.totalHits,
    this.hits,
  });

  int? total;
  int? totalHits;
  List<Hit>? hits;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        total: json["total"] == null ? null : json["total"],
        totalHits: json["totalHits"] == null ? null : json["totalHits"],
        hits: json["hits"] == null
            ? null
            : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "totalHits": totalHits == null ? null : totalHits,
        "hits": hits == null
            ? null
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Hit({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  dynamic id;
  dynamic pageUrl;
  Type? type;
  dynamic tags;
  dynamic previewUrl;
  dynamic previewWidth;
  dynamic previewHeight;
  dynamic webformatUrl;
  dynamic webformatWidth;
  dynamic webformatHeight;
  dynamic largeImageUrl;
  dynamic imageWidth;
  dynamic imageHeight;
  dynamic imageSize;
  dynamic views;
  dynamic downloads;
  dynamic collections;
  dynamic likes;
  dynamic comments;
  dynamic userId;
  dynamic user;
  dynamic userImageUrl;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"] == null ? null : json["id"],
        pageUrl: json["pageURL"] == null ? null : json["pageURL"],
        tags: json["tags"] == null ? null : json["tags"],
        previewUrl: json["previewURL"] == null ? null : json["previewURL"],
        previewWidth:
            json["previewWidth"] == null ? null : json["previewWidth"],
        previewHeight:
            json["previewHeight"] == null ? null : json["previewHeight"],
        webformatUrl:
            json["webformatURL"] == null ? null : json["webformatURL"],
        webformatWidth:
            json["webformatWidth"] == null ? null : json["webformatWidth"],
        webformatHeight:
            json["webformatHeight"] == null ? null : json["webformatHeight"],
        largeImageUrl:
            json["largeImageURL"] == null ? null : json["largeImageURL"],
        imageWidth: json["imageWidth"] == null ? null : json["imageWidth"],
        imageHeight: json["imageHeight"] == null ? null : json["imageHeight"],
        imageSize: json["imageSize"] == null ? null : json["imageSize"],
        views: json["views"] == null ? null : json["views"],
        downloads: json["downloads"] == null ? null : json["downloads"],
        collections: json["collections"] == null ? null : json["collections"],
        likes: json["likes"] == null ? null : json["likes"],
        comments: json["comments"] == null ? null : json["comments"],
        userId: json["user_id"] == null ? null : json["user_id"],
        user: json["user"] == null ? null : json["user"],
        userImageUrl:
            json["userImageURL"] == null ? null : json["userImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "pageURL": pageUrl == null ? null : pageUrl,
        "tags": tags == null ? null : tags,
        "previewURL": previewUrl == null ? null : previewUrl,
        "previewWidth": previewWidth == null ? null : previewWidth,
        "previewHeight": previewHeight == null ? null : previewHeight,
        "webformatURL": webformatUrl == null ? null : webformatUrl,
        "webformatWidth": webformatWidth == null ? null : webformatWidth,
        "webformatHeight": webformatHeight == null ? null : webformatHeight,
        "largeImageURL": largeImageUrl == null ? null : largeImageUrl,
        "imageWidth": imageWidth == null ? null : imageWidth,
        "imageHeight": imageHeight == null ? null : imageHeight,
        "imageSize": imageSize == null ? null : imageSize,
        "views": views == null ? null : views,
        "downloads": downloads == null ? null : downloads,
        "collections": collections == null ? null : collections,
        "likes": likes == null ? null : likes,
        "comments": comments == null ? null : comments,
        "user_id": userId == null ? null : userId,
        "user": user == null ? null : user,
        "userImageURL": userImageUrl == null ? null : userImageUrl,
      };
}
