@IsTest
private class FamilySupportPlanHandlerTest {
    @isTest
    static void createVillageTaskTest() {
        // When Family Support Plan is NOT null and Priority is 'High' 
        // and Focus Area is 'Health & Safety'
        // Create at least one Family Support Plan record
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'High',
            CAMPX__Focus_Area__c = 'Health & Safety'
        );
        insert plan;
        // Add plan to list, then pass the list into the test method params

        // Test
        Test.startTest();
        FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
        newPlanHandler.createVillageTask(plan);
        Test.stopTest();
        
        CAMPX__Village_Task__c actual = [SELECT Id, CAMPX__Assigned_Character__c, CAMPX__Status__c, 
                                        CAMPX__Is_Baby_Safety_Critical__c, CAMPX__Task_Type__c,
                                        CAMPX__Support_Phase__c, CAMPX__Family_Support_Plan__c
                                        FROM CAMPX__Village_Task__c 
                                        WHERE CAMPX__Family_Support_Plan__c = :plan.Id
                                        LIMIT 1];
        
        Assert.areEqual('Dr. Grace Evergreen', actual.CAMPX__Assigned_Character__c, 'The assigned person should have been Dr. Grace Evergreen.'); // assigned character
        Assert.areEqual('Not Started', actual.CAMPX__Status__c, 'The stask status should be Not Started.'); // status
        Assert.isTrue(actual.CAMPX__Is_Baby_Safety_Critical__c, 'The Baby Safety checkbox should have been checked and marked as True.'); // baby safety
        Assert.areEqual(plan.Id, actual.CAMPX__Family_Support_Plan__c, 'The village task should be linked to the created Family Support Plan.'); // family support plan (id)
        
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