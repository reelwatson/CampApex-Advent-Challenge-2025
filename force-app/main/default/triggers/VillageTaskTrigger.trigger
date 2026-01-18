trigger VillageTaskTrigger on CAMPX__Village_Task__c (before insert, before update, before delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            VillageTaskHandler.assignVillageTaskBeforeInsert(Trigger.new);
            VillageTaskHandler.beforeBabyArrivesDeadlinesBeforeInsert(Trigger.new);
            VillageTaskHandler.requireAssignmentBeforeCompletion(Trigger.new);
        }
    }
    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            VillageTaskHandler.requireAssignmentBeforeCompletion(Trigger.new);
        }
    }
    if (Trigger.isDelete) {
        if (Trigger.isBefore) {
            VillageTaskHandler.stopCriticalTaskDelete(Trigger.old);
        }
    }
}