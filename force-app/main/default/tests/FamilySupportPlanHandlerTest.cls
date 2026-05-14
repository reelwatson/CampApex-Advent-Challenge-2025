@IsTest
// TO DO: Change ALL tests to create empty List<Family Support Plan>, then populate with 1+ Family Support Plans,
// then pass list into method
private class FamilySupportPlanHandlerTest {
    @isTest
    static void createVillageTaskTest() {
        // When Family Support Plan is NOT null and Priority is 'High' 
        // and Focus Area is 'Health & Safety'
        // Create at least one Family Support Plan record
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'High',
            CAMPX__Focus_Area__c = 'Health & Safety'
        );
        plans.add(plan);
        insert plans;
        // Add plans to list, then pass the list into the test method params

        // Test
        Test.startTest();
        FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
        newPlanHandler.createVillageTask(plans);
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
    static void throwExceptionWhenFamilySupportPlanIsNull() {
        // When Family Support Plan is null
        // Test
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
            newPlanHandler.createVillageTask(null);
            Assert.fail('This statement should not be reached because the code should throw an exception when using null records as a parameter.');
        }
        catch (Exception e) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'Should have thrown an exception trying to run createVillageTask() when Family Support Plan param is null.');
        }
        Test.stopTest();
        
        CAMPX__Village_Task__c actual = [SELECT Id, CAMPX__Assigned_Character__c, CAMPX__Status__c, 
                                        CAMPX__Is_Baby_Safety_Critical__c, CAMPX__Task_Type__c,
                                        CAMPX__Support_Phase__c, CAMPX__Family_Support_Plan__c
                                        FROM CAMPX__Village_Task__c 
                                        WHERE CAMPX__Family_Support_Plan__c = :plan.Id
                                        LIMIT 1];
        // Assert no Village Task created
        Assert.isNull(actual, 'No task should have been created since there is no Family Support Plan. Actual: ' + actual);
        // Assert DML Exception thrown
        AssertException();
    }
    @IsTest
    static void createVillageTaskFocusAreaNotHealthAndSafety() {
        // When Focus Area is NOT 'Health & Safety'
        // Create at least one Family Support Plan record
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'High',
            CAMPX__Focus_Area__c = 'Food & Meals'
        );
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        plans.add(plan);
        insert plans;
        // Add plan to list, then pass the list into the test method params

        // Test
        Test.startTest();
        FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
        newPlanHandler.createVillageTask(plans);
        Test.stopTest();
        
        CAMPX__Village_Task__c actual = [SELECT Id, CAMPX__Assigned_Character__c, CAMPX__Status__c, 
                                        CAMPX__Is_Baby_Safety_Critical__c, CAMPX__Task_Type__c,
                                        CAMPX__Support_Phase__c, CAMPX__Family_Support_Plan__c
                                        FROM CAMPX__Village_Task__c 
                                        WHERE CAMPX__Family_Support_Plan__c = :plan.Id
                                        LIMIT 1];
        // Assert task NOT created for plan
        Assert.isNull(actual, 'The number of tasks should have been null because the Focus Area is not Health & Safety. Instead is ' + actual);

    }

    @IsTest
    static void createVillageTaskPriorityIsNotHigh() {
        // When Priority is NOT 'High'
        // Create at least one Family Support Plan record
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'Low',
            CAMPX__Focus_Area__c = 'Health & Safety'
        );
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        plans.add(plan);
        insert plans;
        // Add plan to list, then pass the list into the test method params

        // Test
        Test.startTest();
        FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
        newPlanHandler.createVillageTask(plans);
        Test.stopTest();
        
        CAMPX__Village_Task__c actual = [SELECT Id, CAMPX__Assigned_Character__c, CAMPX__Status__c, 
                                        CAMPX__Is_Baby_Safety_Critical__c, CAMPX__Task_Type__c,
                                        CAMPX__Support_Phase__c, CAMPX__Family_Support_Plan__c
                                        FROM CAMPX__Village_Task__c 
                                        WHERE CAMPX__Family_Support_Plan__c = :plan.Id
                                        LIMIT 1];
        // Test
        // Assert task NOT created for plan
        Assert.isNull(actual, 'The number of tasks should have been null because the Priority is not High. Instead is ' + actual);

    }

    @IsTest
    static void createVillageTaskNullPointerExceptionTest() {
        //When any other exception thrown
        Boolean nullPointerExceptionThrown = false;
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        plans.add(null);
        // Add plan to list, then pass the list into the test method params

        // Test
        Test.startTest();
        try {
            FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
            newPlanHandler.createVillageTask(plans);
            Assert.fail('This statement should not be reached because an exception should be thrown on a list will any null elements.');
        }
        catch (NullPointerException npe) {
            nullPointerExceptionThrown = true;
            Assert.isTrue(nullPointerExceptionThrown, 'A null pointer exception should have been thrown because the list contains a null element.');
        }
        Test.stopTest();
        
    }
    @IsTest
    static void bulkCreateVillageTaskTest() {
        // Same as first test but with bulk record count (200+)

        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();

        for (Integer i = 0; i <= 201; i++) {
            CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
                CAMPX__Priority__c = 'High',
                CAMPX__Focus_Area__c = 'Health & Safety'
            );
            plans.add(plan);
        }
        insert plans;

        Test.startTest();
        FamilySupportPlanHandler newPlanHandler = new FamilySupportPlanHandler();
        newPlanHandler.createVillageTask(plans);
        Test.stopTest();

        // Query that 202 tasks were created
        Integer numberOfTasksCreated = [SELECT COUNT(Id)
                                        FROM CAMPX__Village_Task__c
                                        WHERE CAMPX__Family_Support_Plan__c IN :plans];
        Assert.areEqual(202, numberOfTasksCreated, 'The method should have created 202 tasks, instead created ' + numberOfTasksCreated);
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