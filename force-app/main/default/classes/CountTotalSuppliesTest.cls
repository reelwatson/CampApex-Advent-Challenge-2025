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
private class CountTotalSuppliesTest {

    @isTest
    static void positiveCountTotalSupplies() {
        // TO DO: implement unit test
        Map<String, Integer> positiveMap = new Map<String, Integer> {
            'Diapers' => 20,
            'Wipes' => 9,
            'Swaddles' => 5
        };
        Test.startTest();
        Integer positiveCount = CountTotalSupplies.countTotalSupplies(positiveMap);
        Test.stopTest();
        Assert.isTrue(positiveCount == 34, 'We should have found 34 items');
    }

    @IsTest
    static void negativeCountTotalSupplies() {
        Map<String, Integer> negativeMap = new Map<String, Integer>();
        Test.startTest();
        Integer zeroCount = CountTotalSupplies.countTotalSupplies(negativeMap);
        Test.stopTest();
        Assert.isTrue(zeroCount == 0, 'The number should have been zero.');
    }
}