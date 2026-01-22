@IsTest
private class FamilySupportPlanHandlerTest {
    @isTest
    static void createVillageTaskTest() {
        //When Family Support Plan is NOT null and Priority is 'High' and Focus Area is 'Health & Safety'
    }

    static void doNotCreateVillageTaskTest() {
        //When Family Support Plan is null
        //When Priority is NOT 'High'
        //When Focus Area is NOT 'Health & Safety'
    }

    static void createVillageTaskDmlExceptionTest() {
        //When DML exception thrown
    }

    static void createVillageTaskOtherExceptionTest() {
        //When any other exception thrown
    }
}