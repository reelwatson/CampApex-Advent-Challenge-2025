@IsTest
private class FamilySupportPlanHandlerTest {
    @isTest
    static void createVillageTaskTest() {
        // When Family Support Plan is NOT null and Priority is 'High' 
        // and Focus Area is 'Health & Safety'
        // Create at least one Family Support Plan record
        // Test
        // Assert
    }

    @IsTest
    static void createVillageTaskFamilySupportPlanNull() {
        // When Family Support Plan is null
        // Test
        // Assert task NOT created for plan

    }
    @IsTest
    static void createVillageTaskFocusAreaNotHealthAndSafety() {
        // When Focus Area is NOT 'Health & Safety'
        // Create at least one Family Support Plan record
        // Test
        // Assert task NOT created for plan

    }

    @IsTest
    static void createVillageTaskPriorityIsNotHigh() {
        // When Priority is NOT 'High'
        // Create at least one Family Support Plan record
        // Test
        // Assert task NOT created for plan

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
    static void bulkCreateVillageTaskTest() {
        // Same as first test but with bulk record count (200+)
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