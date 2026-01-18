trigger FamilySupportPlanTrigger on CAMPX__Family_Support_Plan__c (after insert, after update, before delete) {
    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            FamilySupportPlanHandler.createVillageTask(Trigger.new);
        }
    }
    if (Trigger.isUpdate) {
        if (Trigger.isAfter) {
            FamilySupportPlanHandler.syncPhaseToTasks(Trigger.new,Trigger.oldMap);
        }
    }
    if (Trigger.isDelete) {
        if (Trigger.isBefore) {
            FamilySupportPlanHandler.blockHighPriorityPlanDeletion(Trigger.oldMap);
        }
    }
}