{
  "id": "PostLike",
  "packageName": "eliud_pkg_feed_model",
  "packageFriendlyName": "feed",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
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
  "memberIdentifier": "memberId",
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
      "fieldName": "postId",
      "required": true,
      "displayName": "Document ID of the post",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "postCommentId",
      "displayName": "Document ID of the comment (in case of a like on a comment)",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "memberId",
      "required": true,
      "displayName": "Member",
      "fieldType": "String",
      "group": "member"
    },
    {
      "fieldName": "timestamp",
      "displayName": "Timestamp",
      "fieldType": "ServerTimestamp",
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
      "fieldName": "likeType",
      "displayName": "How do you like this?",
      "fieldType": "enum",
      "enumName": "LikeType",
      "enumValues" : [ "like", "dislike" ]
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "member",
        "description": "Member"
    }
 ],
  "listFields": {
    "title": "value.timestamp != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.timestamp!.toString())) : Container()",
    "subTitle": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))"
  },
  "depends": ["eliud_core_main", "eliud_pkg_membership_model"]
}