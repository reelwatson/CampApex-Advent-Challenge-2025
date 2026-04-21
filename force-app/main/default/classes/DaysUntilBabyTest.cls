
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

    // Create test to confirm both dates are not blank
    @IsTest
    static void nullDateTest() {
        String today;
        String dueDate = '2026-01-11';
        Boolean exceptionThrown = false;

        Test.startTest();
        try {
            Integer daysToBaby = DaysUntilBaby.daysUntilBaby(today, dueDate);
            Assert.fail('The method should have failed because the "today" date is null.');
        }
        catch (CustomExceptions.DaysUntilBabyException dube) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'The method should have thrown an exception.');
        }
        Test.stopTest();
    }

    // Create test to confirm both dates are not null
    @IsTest
    static void blankDateTest() {
        String today = '';
        String dueDate = '2026-01-11';
        Boolean exceptionThrown = false;

        Test.startTest();
        try {
            Integer daysToBaby = DaysUntilBaby.daysUntilBaby(today, dueDate);
            Assert.fail('The method should have failed because the "today" date is blank.');
        }
        catch (CustomExceptions.DaysUntilBabyException dube) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'The method should have thrown an exception.');
        }
        Test.stopTest();

    }
    // Create test to confirm today is valid date (NOT ex: February 30)
    @IsTest
    static void todayNotValidDate() {
        String today = '2026-02-31';
        String dueDate = '2026-01-11';
        Boolean exceptionThrown = false;

        Test.startTest();
        try {
            Integer daysToBaby = DaysUntilBaby.daysUntilBaby(today, dueDate);
            Assert.fail('The method should have failed because the "today" date is February 31, an invalid date.');
        }
        catch (CustomExceptions.DaysUntilBabyException dube) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'The method should have thrown an exception.');
        }
        Test.stopTest();

    }
    // Create test to confirm dueDate is valid date (NOT ex: February 30)
    @IsTest
    static void dueDateNotValidDate() {
        String today = '2026-02-28';
        String dueDate = '2026-11-31';
        Boolean exceptionThrown = false;

        Test.startTest();
        try {
            Integer daysToBaby = DaysUntilBaby.daysUntilBaby(today, dueDate);
            Assert.fail('The method should have failed because the "dueDate" date is November 31, an invalid date.');
        }
        catch (CustomExceptions.DaysUntilBabyException dube) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'The method should have thrown an exception.');
        }
        Test.stopTest();
        
    }
}