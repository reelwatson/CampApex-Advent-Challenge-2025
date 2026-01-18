public class VillageTaskHandler {
    public static void assignVillageTaskBeforeInsert(List<CAMPX__Village_Task__c> tasks) {
        if (!tasks.isEmpty()) {
            for (CAMPX__Village_Task__c task : tasks) {
                switch on task.CAMPX__Task_Type__c {
                    when 'Cook / Deliver Meal' {
                        task.CAMPX__Assigned_Character__c = 'Grandma Kelly';
                    }
                    when 'Build / Fix' {
                        task.CAMPX__Assigned_Character__c = 'Stella Pinewood';
                    }
                    when 'Health & Safety Check' {
                        task.CAMPX__Assigned_Character__c = 'Dr. Grace Evergreen';
                    }
                    when 'Decorate' {
                        task.CAMPX__Assigned_Character__c = 'Poppy Wintergold';
                    }
                    when 'Garden / Outdoor' {
                        task.CAMPX__Assigned_Character__c = 'Ivy Evergreen';
                    }
                    when else {
                        System.debug('Task Type does not require assigned character');
                    }
                }
            }
        }
        else {
            System.debug('No tasks were found in the list.');
        }
    }
    
    public static void stopCriticalTaskDelete(List<CAMPX__Village_Task__c> tasks) {
        List<CAMPX__Village_Task__c> tasksToDelete = new List<CAMPX__Village_Task__c>();
        
        //This approach will block entire operation from performing if one VT meets criteria
        //Else all VTs will delete
        //Alternative approach: remove 'break' to allow matching some records to be deleted
        //while others are still blocked from deletion
        for (CAMPX__Village_Task__c task : tasks) {
            if (task.CAMPX__Is_Baby_Safety_Critical__c == true && task.CAMPX__Status__c != 'Completed') {
                task.addError('Cannot delete safety-critical tasks that are not completed. Please complete the task first or contact your administrator.');
            }
            else {
                tasksToDelete.add(task);
            }
        }
        try {
            delete tasksToDelete;
        }
        catch (DmlException dmle) {
            System.debug('The DML Exception is: ' + dmle.getMessage());
        }
        catch (Exception e) {
            System.debug('The Exception is: ' + e.getMessage());
        }
    }
    
    public static void beforeBabyArrivesDeadlinesBeforeInsert(List<CAMPX__Village_Task__c> tasks) {
        for (CAMPX__Village_Task__c task : tasks) {
            if (task.CAMPX__Support_Phase__c == 'Before Baby Arrives' && task.CAMPX__Due_Date__c == null) {
                task.CAMPX__Due_Date__c = Date.today().addDays(14);
            }
        }
    }
    
    public static void requireAssignmentBeforeCompletion(List<CAMPX__Village_Task__c> tasks) {
        List<CAMPX__Village_Task__c> completedTasks = new List<CAMPX__Village_Task__c>();
        for (CAMPX__Village_Task__c task : tasks) {
            if (task.CAMPX__Status__c == 'Completed' && task.CAMPX__Assigned_Character__c == null) {
                task.addError('Cannot complete a task without assigning it to a villager first.');
            }
            else {
                completedTasks.add(task);
            }
        }
        try {
            delete completedTasks;
        }
        catch (DmlException dmle) {
            System.debug('The DML Exception is: ' + dmle.getMessage());
        }
        catch (Exception e) {
            System.debug('The Exception is: ' + e.getMessage());
        }
    }
}