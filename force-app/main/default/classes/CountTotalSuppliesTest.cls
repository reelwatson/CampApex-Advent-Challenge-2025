
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

    //TO DO: Add test for IllegalArgumentException that should throw when Map is not passed into method

    // TO DO: Refactor to catch custom Exception when Map is empty
    // @IsTest
    // static void negativeCountTotalSupplies() {
    //     Map<String, Integer> nullMap = new Map<String, Integer>();
    //     Test.startTest();
    //     Integer zeroCount = CountTotalSupplies.countTotalSupplies(negativeMap);
    //     Test.stopTest();
    //     Assert.isTrue(zeroCount == 0, 'The number should have been zero.');
    // }

    // TO DO: Refactor the class and this unit test to throw Exception (custom?) telling end user that they cannot add items with 0 units
    // @IsTest
    // static void edgeCountTotalSupplies() {
    //     Map<String, Integer> zeroMap = new Map<String, Integer>{
    //         'Bottle Warmer' => 0,
    //         'Wipes Warmer' => 0,
    //         'Owl Sock' => 0
    //     };
    //     Test.startTest();
    //     Integer zeroItems = CountTotalSupplies.countTotalSupplies(zeroMap);
    //     Test.stopTest();
    //     Assert.isTrue(zeroItems == 0, 'We should have seen zero items because we added keys with values that are all zeroes.');
    // }
}