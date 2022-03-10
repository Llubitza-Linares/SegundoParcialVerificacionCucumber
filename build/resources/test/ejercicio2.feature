Feature: Project

  Scenario: crear proyecto con items y modifificarlos


    Given yo uso la authenticacion basica
    When envio POST request a la /api/projects.json con el body
    """
    {
      "Content":"CRUD Items",
      "Icon":"4"
    }
    """
    Then el codigo de respuesta deberia ser 200
    And el expected body deberia ser
    """
    {
        "Id": "IGNORE",
        "Content": "CRUD Items",
        "ItemsCount": 0,
        "Icon":4,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "IGNORE",
        "Children": [
        ],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "IGNORE",
        "LastUpdatedDate": "IGNORE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """
    And guardo el Id de la respuesta en ID_PROJ

    When envio POST request a la /api/items.json con el body
    """
    {
      "Content":"Nuevo Item",
      "ProjectId":ID_PROJ
    }
    """
    Then el codigo de respuesta deberia ser 200

    And el expected body deberia ser
    """
    {
    "Id": "IGNORE",
    "Content": "Nuevo Item",
    "ItemType": "IGNORE",
    "Checked": false,
    "ProjectId": ID_PROJ,
    "ParentId": "IGNORE",
    "Path": "",
    "Collapsed": "IGNORE",
    "DateString": "IGNORE",
    "DateStringPriority": "IGNORE",
    "DueDate": "",
    "Recurrence": "IGNORE",
    "ItemOrder": "IGNORE",
    "Priority": "IGNORE",
    "LastSyncedDateTime": "IGNORE",
    "Children": [

    ],
    "DueDateTime": "IGNORE",
    "CreatedDate": "IGNORE",
    "LastCheckedDate": "IGNORE",
    "LastUpdatedDate": "IGNORE",
    "Deleted": "IGNORE",
    "Notes": "IGNORE",
    "InHistory": "IGNORE",
    "SyncClientCreationId": "IGNORE",
    "DueTimeSpecified": "IGNORE",
    "OwnerId": "IGNORE"
}
    """

    And guardo el Id de la respuesta en ID_ITEM


    When envio PUT request a la /api/items/ID_ITEM.json con el body
    """
    {
      "Content":"ItemActualizado"
    }
    """
    Then el codigo de respuesta deberia ser 200
    And el atributo Content deberia ser ItemActualizado

    When envio DELETE request a la /api/items/ID_ITEM.json con el body
    """
    """
    Then el codigo de respuesta deberia ser 200
    And el atributo Content deberia ser ItemActualizado

