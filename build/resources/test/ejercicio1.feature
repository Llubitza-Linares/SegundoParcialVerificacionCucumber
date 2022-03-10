Feature: Project

  Scenario: Creacion y modificacion de usuario


    Given Quiero crear un usario
    When envio POST request a la /api/user.json con el body
    """
    {
      "Email":"nuevo_usuario2000@api.com",
      "Password":"12345",
      "FullName":"Llubitza Linares"
    }
    """
    Then el codigo de respuesta deberia ser 200
    And el expected body deberia ser
    """
    {
        "Id": "IGNORE",
        "Email": "nuevo_usuario2000@api.com",
        "FullName": "Llubitza Linares",
        "TimeZone":"IGNORE",
        "IsProUser": false,
        "DefaultProjectId": "IGNORE",
        "AddItemMoreExpanded": false,
        "EditDueDateMoreExpanded":  "IGNORE",
        "ListSortType": 0,
        "FirstDayOfWeek": "IGNORE",
        "NewTaskDueDate": "IGNORE"
    }
    """

    And guardo el Id de la respuesta en ID_USR

    Given con el nuevo usuario yo uso la authenticacion basica

    When envio PUT request a la /api/user/0.json con el body
    """
    {
      "Email":"New_nuevo_usuario2000@api.com"
    }
    """
    Then el codigo de respuesta deberia ser 200

    And el atributo Email deberia ser New_nuevo_usuario2000@api.com