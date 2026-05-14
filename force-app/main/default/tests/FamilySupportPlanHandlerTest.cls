@IsTest
private class FamilySupportPlanHandlerTest {
    @isTest
    static void createVillageTaskTest() {
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'High',
            CAMPX__Focus_Area__c = 'Health & Safety'
        );
        plans.add(plan);
        insert plans;

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
        Assert.isNull(actual, 'No task should have been created since there is no Family Support Plan. Actual: ' + actual);
        AssertException();
    }
    @IsTest
    static void createVillageTaskFocusAreaNotHealthAndSafety() {
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'High',
            CAMPX__Focus_Area__c = 'Food & Meals'
        );
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        plans.add(plan);
        insert plans;
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
        Assert.isNull(actual, 'The number of tasks should have been zero because the Focus Area is not Health & Safety. Instead is ' + actual);

    }

    @IsTest
    static void createVillageTaskPriorityIsNotHigh() {
        CAMPX__Family_Support_Plan__c plan = new CAMPX__Family_Support_Plan__c(
            CAMPX__Priority__c = 'Low',
            CAMPX__Focus_Area__c = 'Health & Safety'
        );
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        plans.add(plan);
        insert plans;
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
        Assert.isNull(actual, 'The number of tasks should have been zero because the Priority is not High. Instead is ' + actual);

    }

    @IsTest
    static void createVillageTaskNullPointerExceptionTest() {
        Boolean nullPointerExceptionThrown = false;
        List<CAMPX__Family_Support_Plan__c> plans = new List<CAMPX__Family_Support_Plan__c>();
        plans.add(null);
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