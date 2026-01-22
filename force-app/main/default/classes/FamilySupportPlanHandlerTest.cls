@IsTest
private class FamilySupportPlanHandlerTest {
    @isTest
    static void createVillageTaskTest() {
        //When Family Support Plan is NOT null and Priority is 'High' and Focus Area is 'Health & Safety'
    }

    @IsTest
    static void doNotCreateVillageTaskTest() {
        //When Family Support Plan is null
        //When Priority is NOT 'High'
        //When Focus Area is NOT 'Health & Safety'
    }
    @IsTest
    static void createVillageTaskDmlExceptionTest() {
        //When DML exception thrown
    }

    @IsTest
    static void createVillageTaskOtherExceptionTest() {
        //When any other exception thrown
    }

    @IsTest
    static void syncPhaseToTasksTest() {

    }

    @IsTest
    static void doNotSyncPhaseToTasksTest() {

    }

    @IsTest
    static void syncPhaseToTaskDmlExceptionTest() {
        //When DML exception thrown
    }

    @IsTest
    static void syncPhaseToTaskOtherExceptionTest() {
        //When any other exception thrown
    }

    @IsTest
    static void blockHighPriorityPlanDeletionTest() {

    }

    @IsTest
    static void doNotBlockHighPriorityPlanDeletionTest() {

    }

    @IsTest
    static void blockHighPriorityPlanDeletionExceptionTest() {
        //When any exception thrown
    }

}