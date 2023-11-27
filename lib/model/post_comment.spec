{
  "id": "PostComment",
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
      "displayName": "Document ID of the post",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "postCommentId",
      "displayName": "Document ID of the comment (in case of a comment on comment)",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "memberId",
      "displayName": "Member",
      "fieldType": "String",
      "group": "general"
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
      "fieldName": "comment",
      "displayName": "Comment",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "likes",
      "displayName": "Likes",
      "fieldType": "int",
      "group": "general"
    },
    {
      "fieldName": "dislikes",
      "displayName": "Dislikes",
      "fieldType": "int",
      "group": "general"
    },
    {
      "fieldName": "memberMedia",
      "fieldType": "MemberMedium",
      "displayName": "Media",
      "group": "media",
      "arrayType": "Array"
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
    },
    {
        "group": "media",
        "description": "Media"
    }
 ],
  "listFields": {
    "title": "value.timestamp != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.timestamp!.toString())) : Container()",
    "subTitle": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))"
  },
  "depends": ["eliud_core_main", "eliud_core_model", "eliud_pkg_membership_model"]
}