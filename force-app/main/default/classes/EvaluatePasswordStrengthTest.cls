@isTest
private class EvaluatePasswordStrengthTest {

    @isTest
    static void allCapsWithNumbersOrSymbols() {
        String password = 'ALLCAPS123!';
        String mediumStrength = 'medium';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(mediumStrength, result, 'The password should have evaluated to medium.');
    }

    @isTest
    static void weakPasswordOnlyAlpha() {

    }

    @isTest
    static void weakPasswordOnlyNumbers() {

    }

    @isTest
    static void weakPasswordOnlySymbols() {

    }

    @istest
    static void mediumPasswordTwoRules() {

    }

    @isTest
    static void mediumPasswordThreeRules() {

    }

    @isTest
    static void strongPassword() {

    }

    @isTest
    static void emptyString() {

    }
}