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
        String testString = '';
        PerfectWreathSymmetry wreath = new PerfectWreathSymmetry();
        Boolean symmetryBoolean = wreath.isSymmetric(testString);
        Assert.isTrue(symmetryBoolean, 'The boolean should have returned as True, instead returned as False.');
    }

    @IsTest
    static void singleCharacterString() {
        String testString = 'Z';
        PerfectWreathSymmetry wreath = new PerfectWreathSymmetry();
        Boolean symmetryBoolean = wreath.isSymmetric(testString);
        Assert.isTrue(symmetryBoolean, 'The boolean should have returned as True, instead returned as False.');
    }

    @IsTest
    static void caseSensitivity() {
        String testString = 'aBab';
        PerfectWreathSymmetry wreath = new PerfectWreathSymmetry();
        Boolean symmetryBoolean = wreath.isSymmetric(testString);
        Assert.isFalse(symmetryBoolean, 'The boolean should have returned as False, instead returned as True.');
    }

    @IsTest
    static void oddLengthString() {

    }
}