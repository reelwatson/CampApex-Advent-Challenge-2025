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
        String password = 'abcdef';
        String strength = 'weak';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The password should have evaluated to weak.');
    }

    @isTest
    static void weakPasswordOnlyNumbers() {
        String password = '12345';
        String strength = 'weak';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The password should have evaluated to weak.');
    }

    @isTest
    static void weakPasswordOnlySymbols() {
        String password = '#%^&';
        String strength = 'weak';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The password should have evaluated to weak.');
    }

    @istest
    static void mediumPasswordTwoRules() {
        String password = 'Happy3';
        String strength = 'medium';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The password should have evaluated to medium.');
    }

    @isTest
    static void mediumPasswordThreeRules() {
        String password = 'Hello3!';
        String strength = 'medium';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The password should have evaluated to medium.');
    }

    @isTest
    static void strongPassword() {
        String password = 'HelloLove3!';
        String strength = 'strong';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The password should have evaluated to strong.');
    }

    @isTest
    static void emptyString() {
        String password = '';
        String strength = 'weak';
        Test.startTest();
        EvaluatePasswordStrength testPassword = new EvaluatePasswordStrength();
        String result = testPassword.EvaluatePasswordStrength(password);
        Test.stopTest();
        Assert.areEqual(strength, result, 'The empty password should have evaluated to weak.');
    }
}