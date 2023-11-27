{
  "id": "Post",
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
  "memberIdentifier": "authorId",
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
      "fieldName": "authorId",
      "required": true,
      "displayName": "Author ID",
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
      "fieldName": "feedId",
      "displayName": "Feed Identifier",
      "remark": "This is the identifier of the feed (optional as a post can also be used in an album)",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "postAppId",
      "displayName": "Post App Identifier",
      "remark": "This is the identifier of the app to where this feed points to",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "postPageId",
      "displayName": "Post Page Identifier",
      "remark": "This is the identifier of the page to where this feed points to",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "pageParameters",
      "fieldType": "bespoke",
      "bespokeFieldType": "Map<String, dynamic>",
      "bespokeEntityMapping": "map['pageParameters']",
      "bespokeEntityToDocument" : "    theDocument['pageParameters'] = pageParameters;\n"
    },
    {
      "fieldName": "html",
      "displayName": "Rich Text",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "iconName": "text_format",
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
      "fieldName": "accessibleByGroup",
      "fieldType": "enum",
      "enumName": "PostAccessibleByGroup",
      "enumValues" : [ "public", "followers", "me", "specificMembers" ]
    },
    {
      "fieldName": "accessibleByMembers",
      "remark": "In case accessibleByGroup == SpecificMembers, then these are the members",
      "displayName": "Accessible By Members",
      "fieldType": "String",
      "iconName": "text_format",
      "arrayType": "Array",
      "hidden": true
    },
    {
      "fieldName": "readAccess",
      "displayName": "Members that can read this detail of the chat. This is determined in functions, based on accessibleByGroup and accessibleByMembers",
      "fieldType": "String",
      "iconName": "text_format",
      "arrayType": "Array",
      "hidden": true
    },
    {
      "fieldName": "archived",
      "fieldType": "enum",
      "defaultValue": "PostArchiveStatus.active",
      "enumName": "PostArchiveStatus",
      "enumValues" : [ "active", "archived" ]
    },
    {
      "fieldName": "externalLink",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "memberMedia",
      "fieldType": "MemberMediumContainer",
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