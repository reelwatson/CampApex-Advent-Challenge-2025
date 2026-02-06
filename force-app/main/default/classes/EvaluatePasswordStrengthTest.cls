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
}