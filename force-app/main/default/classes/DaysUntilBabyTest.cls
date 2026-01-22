
@isTest
private class DaysUntilBabyTest {

    @isTest
    static void positiveDaysUntilBaby() {
        String today = '2026-01-01';
        String dueDate = '2026-01-11';

        Test.startTest();
        Integer daysToBaby = DaysUntilBaby.daysUntilBaby(today, dueDate);
        Test.stopTest();

        Assert.areEqual(10, daysToBaby, 'This should have calculated to ten days.');
    }
    @IsTest
    static void babyOverdue() {
        String today = '2026-12-11';
        String dueDate = '2026-12-01';

        Test.startTest();
        Integer daysSinceBabyDue = DaysUntilBaby.daysUntilBaby(today, dueDate);
        Test.stopTest();

        Assert.areEqual(-10, daysSinceBabyDue, 'The number of days since the baby was due should be -10.');
    }
}