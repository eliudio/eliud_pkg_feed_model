{
  "id": "FeedMenu",
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
    "isExtension": true,
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
      "fieldName": "bodyComponentsCurrentMember",
      "displayName": "Components Current Member",
      "fieldType": "LabelledBodyComponent",
      "arrayType": "Array",
      "group": "components"
    },
    {
      "fieldName": "bodyComponentsOtherMember",
      "displayName": "Components Other Member",
      "fieldType": "LabelledBodyComponent",
      "arrayType": "Array",
      "group": "components"
    },
    {
      "fieldName": "itemColor",
      "displayName": "Item Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "itemColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Text color\", state.value!.itemColor, _onItemColorChanged)"
    },
    {
      "fieldName": "selectedItemColor",
      "displayName": "Selected Item Color",
      "fieldType": "Rgb",
      "group": "itemColors",
      "iconName": "color_lens",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "bespokeFormField": "RgbField(widget.app, \"Selected Item Color\", state.value!.selectedItemColor, _onSelectedItemColorChanged)"
    },
    {
      "fieldName": "backgroundOverride",
      "displayName": "Background Override",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "feedFront",
      "displayName": "Feed Front",
      "fieldType": "FeedFront",
      "association": true,
      "group": "general"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "itemColors",
        "description": "Icon Colors"
    },
    {
        "group": "menuColors",
        "description": "Menu Colors"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
 ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : Center(child: text(app, context, value.documentID))"
  },
  "depends": ["eliud_core_main"]
}