public class FamilySupportPlanHandler {
    public static void createVillageTask(List<CAMPX__Family_Support_Plan__c> plans) {
       	//Create an empty list of Village Task records to insert after loop
       	List<CAMPX__Village_Task__c> tasks = new List<CAMPX__Village_Task__c>();
       	//Loop through each Family Support Plan
        for (CAMPX__Family_Support_Plan__c plan: plans) {
            //Check conditions on each Family Support Plan
            if (plan != null && plan.CAMPX__Priority__c == 'High' && plan.CAMPX__Focus_Area__c == 'Health & Safety') {
                // Create a related Village Task for each qualifying record
                CAMPX__Village_Task__c villageTask = new CAMPX__Village_Task__c();
                villageTask.CAMPX__Assigned_Character__c = 'Dr. Grace Evergreen';
				villageTask.CAMPX__Status__c = 'Not Started';
				villageTask.CAMPX__Is_Baby_Safety_Critical__c = true;
				villageTask.CAMPX__Task_Type__c = 'Health & Safety Check';
				villageTask.CAMPX__Support_Phase__c = plan.CAMPX__Phase__c;
				villageTask.CAMPX__Family_Support_Plan__c = plan.Id;
				tasks.add(villageTask);                
            }
        }
        //Try to insert the list of Village Tasks
        try {
            insert tasks;
        }
        //Catch DML Exception
        catch (DmlException dmle) {
            System.debug('The following DML exception has occurred: ' + dmle.getMessage());
        }
        //Catch any other thrown exceptions
        catch (Exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }
    
    public static void syncPhaseToTasks(List<CAMPX__Family_Support_Plan__c> newPlansList, Map<Id, CAMPX__Family_Support_Plan__c> oldPlansMap) {
        List<CAMPX__Village_Task__c> updatedTasks = new List<CAMPX__Village_Task__c>();
        Set<Id> changedPlansIds = new Set<Id>();
        for (CAMPX__Family_Support_Plan__c newPlan : newPlansList) {
            CAMPX__Family_Support_Plan__c oldPlan = oldPlansMap.get(newPlan.Id);
            if (oldPlan != null && oldPlan.CAMPX__Phase__c != newPlan.CAMPX__Phase__c) {
                changedPlansIds.add(newPlan.Id);
            }
        }
        
        updatedTasks = [SELECT Id, CAMPX__Support_Phase__c, CAMPX__Family_Support_Plan__r.CAMPX__Phase__c FROM CAMPX__Village_Task__c WHERE CAMPX__Family_Support_Plan__c IN :changedPlansIds];
        for (CAMPX__Village_Task__c task : updatedTasks) {
            task.CAMPX__Support_Phase__c = task.CAMPX__Family_Support_Plan__r.CAMPX__Phase__c;
        }
        
        try {
            update updatedTasks;
        }
        //Catch DML Exception
        catch (DmlException dmle) {
            System.debug('The following DML exception has occurred: ' + dmle.getMessage());
        }
        //Catch any other thrown exceptions
        catch (Exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }
    
    public static void blockHighPriorityPlanDeletion(Map<Id, CAMPX__Family_Support_Plan__c> plans) {
        Set<Id> plansCannotDeleteIds = new Set<Id>();
        Set<Id> familySupportPlanIds = plans.keySet();
        
        List<CAMPX__Village_Task__c> villageTasks = [SELECT Id, CAMPX__Family_Support_Plan__r.CAMPX__Priority__c 
                                                     FROM CAMPX__Village_Task__c 
                                                     WHERE CAMPX__Family_Support_Plan__c IN :familySupportPlanIds];
        for (CAMPX__Village_Task__c villageTask : villageTasks) {
            if (villageTask.CAMPX__Family_Support_Plan__r.CAMPX__Priority__c == 'High') {
                plansCannotDeleteIds.add(villageTask.CAMPX__Family_Support_Plan__c);
            }
        }
        for (Id famSupportPlanId : plansCannotDeleteIds) {
            plans.get(famSupportPlanId).addError('Cannot delete a high-priority plan that has related tasks. Please remove all tasks first.');
        }
    }
}