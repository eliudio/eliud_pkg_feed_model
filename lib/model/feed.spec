{
  "id": "Feed",
  "packageName": "eliud_pkg_feed_model",
  "packageFriendlyName": "feed",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": false,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this feed belongs",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "thumbImage",
      "displayName": "Thumbs Image",
      "fieldType": "enum",
      "enumName": "ThumbStyle",
      "enumValues" : [ "thumbs", "banana" ]
    },
    {
      "fieldName": "photoPost",
      "displayName": "Photo Post",
      "remark": "Allow photo posts",
      "fieldType": "bool"
    },
    {
      "fieldName": "videoPost",
      "displayName": "Video Post",
      "remark": "Allow video posts",
      "fieldType": "bool"
    },
    {
      "fieldName": "messagePost",
      "displayName": "Message Post",
      "remark": "Allow message posts",
      "fieldType": "bool"
    },
    {
      "fieldName": "audioPost",
      "displayName": "Audio Post",
      "remark": "Allow audio posts",
      "fieldType": "bool"
    },
    {
      "fieldName": "albumPost",
      "displayName": "Album Post",
      "remark": "Allow album posts",
      "fieldType": "bool"
    },
    {
      "fieldName": "articlePost",
      "displayName": "Article Post",
      "remark": "Allow article posts",
      "fieldType": "bool"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
 ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : Center(child: text(app, context, value.documentID))"
  },
  "depends": ["eliud_core_main"]
}