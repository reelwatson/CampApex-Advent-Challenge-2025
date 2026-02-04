@isTest
private class BuildDecorSummaryTest {

    @isTest
    static void variousDecorations() {
        // TO DO: list with different decorations, some repeating
        List<String> uniqueItems = new List<String>{
        'Snowflake','Santa','Snowflake','Reindeer'};
        String uniqueDecorationsString = 'Snowflake x2, Santa x1, Reindeer x1';
        Test.startTest();
        BuildDecorSummary uniqueTestBDS = new BuildDecorSummary();
        String testResults = uniqueTestBDS.BuildDecorSummary(uniqueItems);
        Test.stopTest();

        Assert.areEqual(uniqueDecorationsString, testResults, 'The returned String of mixed items does not match the expected result');
    }

    @isTest
    static void oneDecorationMultipleTimes() {
        // TO DO: list with same decoration multiple times
        List<String> uniqueItems = new List<String>{
        'Snowflake','Snowflake','Snowflake'};
        String uniqueDecorationsString = 'Snowflake x3';
        Test.startTest();
        BuildDecorSummary uniqueTestBDS = new BuildDecorSummary();
        String testResults = uniqueTestBDS.BuildDecorSummary(uniqueItems);
        Test.stopTest();

        Assert.areEqual(uniqueDecorationsString, testResults, 'The returned String of repeating items does not match the expected result');
    }

    @isTest
    static void eachDecorationUnique() {
        // TO DO: List where each decoration is unique
        List<String> uniqueItems = new List<String>{
        'Snowflake','Reindeer','Santa','SNOWFLAKE'};
        String uniqueDecorationsString = 'Snowflake x1, Reindeer x1, Santa x1, SNOWFLAKE x1';
        Test.startTest();
        BuildDecorSummary uniqueTestBDS = new BuildDecorSummary();
        String testResults = uniqueTestBDS.BuildDecorSummary(uniqueItems);
        Test.stopTest();

        Assert.areEqual(uniqueDecorationsString, testResults, 'The returned String of unique items does not match the expected result');
    }

    @isTest
    static void emptyList() {
        // TO DO: empty list
        List<String> uniqueItems = new List<String>();
        String uniqueDecorationsString = '';
        Test.startTest();
        BuildDecorSummary uniqueTestBDS = new BuildDecorSummary();
        String testResults = uniqueTestBDS.BuildDecorSummary(uniqueItems);
        Test.stopTest();

        Assert.areEqual(uniqueDecorationsString, testResults, 'The returned String should be blank.');
    }

    @isTest
    static void emptyDecorationEntries() {
        // TO DO: For real-life example, handle when some entries are blank/null
        // Requires refactoring the code in BuildDecorSummary to check for null entries
    }

    @isTest
    static void caseSensitivity() {
        // TO DO: For real-life example, handle entries in uppercase, lowercase, mixed
        // Requires refactoring the code in BuildDecorSummary
    }

    @isTest
    static void ExceptionHandling() {
        // TO DO: Test for exception handling
    }
}