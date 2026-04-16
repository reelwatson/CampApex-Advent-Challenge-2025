
@isTest
private class CalculateThreadNeededTest {

    @isTest
    static void emptyNamesListTest() {
        // TO DO: assert return is 0
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>();
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};

        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
        Assert.areEqual(0, totalString, 'Because the list of names is empty the method should have returned 0.');
    }

    @IsTest
    static void positiveNamesListTest() {
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'BABA'};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};
        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
        Assert.areEqual(22, totalString, 'The method should have returned 22, instead returned ' + totalString);

    }

    @IsTest
    static void unexpectedLetter() {
        // TO DO: check exception thrown when letter not found in threadPerLetter Map
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'MAMA'};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};
        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
        // TO DO: Write assertion/update test method to check custom exception thrown
        // TO DO: Write assertion to check the correct message shows
    }

    @IsTest
    static void negativeOrZeroMapInteger() {
        // TO DO: Check exception thrown when Integer in the Map is <= 0
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'BABA'};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => -6, 'C' => 7};
        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
        // TO DO: Write assertion/update test method to check custom exception thrown
        // TO DO: Write assertion to check the correct message shows
    }

    @IsTest
    static void someNamesEmpty() {
        // TO DO: Check exception thrown when one name of the "names" list is blank/null/empty
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'BABA','', 'ABBA', null};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};
        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
// TO DO: Write assertion/update test method to check custom exception thrown
// TO DO: Write assertion to check the correct message shows
    }
}