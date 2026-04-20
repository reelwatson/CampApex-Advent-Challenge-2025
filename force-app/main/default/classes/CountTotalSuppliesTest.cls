
@isTest
private class CountTotalSuppliesTest {

    @isTest
    static void positiveCountTotalSupplies() {
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

    // TO DO: Refactor to catch custom Exception when Map is empty
    @IsTest
    static void suppliesMapNull() {
        Map<String, Integer> nullMap = new Map<String, Integer>();
        Boolean exceptionThrown = false;
        Integer suppliesCount = 0;
        Test.startTest();
        try {
            suppliesCount = CountTotalSupplies.countTotalSupplies(nullMap);
            Assert.fail('Should have thrown a custom Exception.');
        }
        catch(CustomExceptions.CountTotalSuppliesException ctse) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'An exception should have been thrown, instead have supply count of ' + suppliesCount);
        }
        Test.stopTest();
    }

    @IsTest
    static void suppliesIntegerValueNull() {
        Map<String, Integer> nullMap = new Map<String, Integer>{
            'Diapers' => null,
            'Wipes' => 9,
            'Swaddles' => 5
        };
        Boolean exceptionThrown = false;
        Integer suppliesCount = 0;

        Test.startTest();
        try {
            suppliesCount = CountTotalSupplies.countTotalSupplies(nullMap);
            Assert.fail('Should have thrown a custom Exception.');
        }
        catch(CustomExceptions.CountTotalSuppliesException ctse) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'An exception should have been thrown, instead have supply count of ' + suppliesCount);
        }

        Test.stopTest();
    }

    @IsTest
    static void suppliesIntegerValueZero() {
        Map<String, Integer> nullMap = new Map<String, Integer>{
            'Diapers' => 0,
            'Wipes' => 9,
            'Swaddles' => 5
        };
        Boolean exceptionThrown = false;
        Integer suppliesCount = 0;

        Test.startTest();
        try {
            suppliesCount = CountTotalSupplies.countTotalSupplies(nullMap);
            Assert.fail('Should have thrown a custom Exception.');
        }
        catch(CustomExceptions.CountTotalSuppliesException ctse) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'An exception should have been thrown, instead have supply count of ' + suppliesCount);
        }

        Test.stopTest();        
    }
}