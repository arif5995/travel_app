

class CollectionResponse {
    CollectionResponse({
        this.collections,
        this.hasMore,
        this.shareUrl,
        this.displayText,
        this.hasTotal,
        this.userHasAddresses,
    });

    List<CollectionElement> collections;
    int hasMore;
    String shareUrl;
    String displayText;
    int hasTotal;
    bool userHasAddresses;

    factory CollectionResponse.fromJson(Map<String, dynamic> json) => CollectionResponse(
        collections: List<CollectionElement>.from(json["collections"].map((x) => CollectionElement.fromJson(x))),
        hasMore: json["has_more"],
        shareUrl: json["share_url"],
        displayText: json["display_text"],
        hasTotal: json["has_total"],
        userHasAddresses: json["user_has_addresses"],
    );

    Map<String, dynamic> toJson() => {
        "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
        "has_more": hasMore,
        "share_url": shareUrl,
        "display_text": displayText,
        "has_total": hasTotal,
        "user_has_addresses": userHasAddresses,
    };
}

class CollectionElement {
    CollectionElement({
        this.collection,
    });

    CollectionCollection collection;

    factory CollectionElement.fromJson(Map<String, dynamic> json) => CollectionElement(
        collection: CollectionCollection.fromJson(json["collection"]),
    );

    Map<String, dynamic> toJson() => {
        "collection": collection.toJson(),
    };
}

class CollectionCollection {
    CollectionCollection({
        this.collectionId,
        this.resCount,
        this.imageUrl,
        this.url,
        this.title,
        this.description,
        this.shareUrl,
    });

    int collectionId;
    int resCount;
    String imageUrl;
    String url;
    String title;
    String description;
    String shareUrl;

    factory CollectionCollection.fromJson(Map<String, dynamic> json) => CollectionCollection(
        collectionId: json["collection_id"],
        resCount: json["res_count"],
        imageUrl: json["image_url"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
        shareUrl: json["share_url"],
    );

    Map<String, dynamic> toJson() => {
        "collection_id": collectionId,
        "res_count": resCount,
        "image_url": imageUrl,
        "url": url,
        "title": title,
        "description": description,
        "share_url": shareUrl,
    };
}
