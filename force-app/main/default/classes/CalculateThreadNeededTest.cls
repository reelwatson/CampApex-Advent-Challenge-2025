
@isTest
private class CalculateThreadNeededTest {

    @isTest
    static void emptyNamesListTest() {
        // TO DO: assert return is 0
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>();
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};

        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Assert.areEqual(0, totalString, 'Because the list of names is empty the method should have returned 0.');
    }

    @IsTest
    static void positiveNamesListTest() {
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'BABA'};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};

        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Assert.areEqual(22, totalString, 'The method should have returned 22, instead returned ' + totalString);

    }

    @IsTest
    static void unexpectedLetter() {
        // TO DO: check exception thrown when letter not found in threadPerLetter Map
        // TO DO: If code refactored then check proper path followed
    }
}