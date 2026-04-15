@isTest
private class PerfectWreathSymmetryTest {

    @isTest
    static void myUnitTest() {
        // TO DO: implement unit test
    }

    @IsTest
    static void symmetricString() {
        String testString = 'o*o';
        PerfectWreathSymmetry wreath = new PerfectWreathSymmetry();
        Boolean symmetryBoolean = wreath.isSymmetric(testString);
        Assert.isTrue(symmetryBoolean, 'The boolean should have returned as True, instead returned as False.');
    }

    @IsTest
    static void nonSymmetricString() {
        String testString = 'aBaB';
        PerfectWreathSymmetry wreath = new PerfectWreathSymmetry();
        Boolean symmetryBoolean = wreath.isSymmetric(testString);
        Assert.isFalse(symmetryBoolean, 'The boolean should have returned as False, instead returned as True.');
    }

    @IsTest
    static void emptyString() {
        
        //Assert.isTrue(condition, msg);
    }

    @IsTest
    static void singleCharacterString() {

        //Assert.isTrue(condition, msg);
    }

    @IsTest
    static void evenLengthString() {

    }

    @IsTest
    static void oddLengthString() {

    }
}