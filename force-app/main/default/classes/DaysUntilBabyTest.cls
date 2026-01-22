/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
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